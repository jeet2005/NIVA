import unittest
from unittest.mock import patch
from urllib.error import HTTPError
from io import BytesIO

from app.main import ContextFact, evidence_refs, execute_tool, groq_chat


class ContextToolsTest(unittest.TestCase):
    def setUp(self):
        self.facts = [
            ContextFact(id="task:t1", kind="task", summary="Review; priority high", source="local_task", freshness="current", confidence=1),
            ContextFact(id="task:t2", kind="task", summary="Old; priority low", source="local_task", freshness="stale", confidence=1),
        ]

    def test_list_tasks_filters_stale_and_strict_priority(self):
        result = execute_tool("list_tasks", '{"priority":"high"}', self.facts)
        self.assertEqual([row["id"] for row in result["tasks"]], ["task:t1"])
        with self.assertRaises(ValueError):
            execute_tool("list_tasks", '{"priority":"root"}', self.facts)
        with self.assertRaises(ValueError):
            execute_tool("list_tasks", '{"priority":"high","command":"rm"}', self.facts)

    def test_replan_is_unexecuted_confirmation_proposal_with_evidence(self):
        result = execute_tool("request_replan", '{"reason":"A meeting moved"}', self.facts)
        self.assertFalse(result["executed"])
        self.assertTrue(result["requires_confirmation"])
        self.assertEqual(result["evidence_ids"], ["task:t1"])

    def test_audit_evidence_references_exclude_user_fact_content(self):
        refs = evidence_refs({"tasks": [{"id": "task:t1", "summary": "private task text"}]})
        self.assertEqual(refs, ["task:t1"])

    def test_unknown_tool_and_malformed_args_rejected(self):
        with self.assertRaises(ValueError): execute_tool("exec", '{}', self.facts)
        with self.assertRaises(ValueError): execute_tool("get_plan", '[]', self.facts)
        with self.assertRaises(ValueError): execute_tool("get_plan", '{"extra":true}', self.facts)

    def test_missing_key_fails_without_fabricating_answer(self):
        with patch.dict("os.environ", {"GROQ_API_KEY": ""}):
            with self.assertRaisesRegex(RuntimeError, "not configured"):
                groq_chat({"messages": []})

    def test_rate_limit_is_reported_without_retry(self):
        error = HTTPError("https://api.groq.com", 429, "limited", {}, BytesIO())
        with patch.dict("os.environ", {"GROQ_API_KEY": "test-only"}), patch("app.main.urlopen", side_effect=error) as mocked:
            with self.assertRaisesRegex(RuntimeError, "rate limit"):
                groq_chat({"messages": []})
        self.assertEqual(mocked.call_count, 1)

    def test_timeout_is_reported_explicitly(self):
        with patch.dict("os.environ", {"GROQ_API_KEY": "test-only"}), patch("app.main.urlopen", side_effect=TimeoutError()):
            with self.assertRaisesRegex(RuntimeError, "unavailable"):
                groq_chat({"messages": []})


if __name__ == "__main__":
    unittest.main()
