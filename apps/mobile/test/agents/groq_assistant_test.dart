import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/agents/groq_assistant.dart';

void main() {
  test('unconfigured client fails explicitly without network access', () async {
    final assistant = GroqAssistant(baseUrl: '');
    expect(assistant.isConfigured, isFalse);
    await expectLater(
      assistant.ask(message: 'What is next?', context: const []),
      throwsA(isA<GroqUnavailable>()),
    );
  });

  test('parses a mocked backend reply and evidence references', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final requestSeen = server.first.then((request) async {
      final body = jsonDecode(await utf8.decoder.bind(request).join()) as Map;
      expect(body['message'], 'What is next?');
      expect((body['context'] as List).single['id'], 'task:t1');
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({
          'answer': 'You have one task due tomorrow.',
          'tool_results': [
            {
              'name': 'list_tasks',
              'result': {
                'evidence_ids': ['task:t1']
              }
            },
          ],
          'provider': 'groq',
        }));
      await request.response.close();
    });
    final assistant = GroqAssistant(
      baseUrl: 'http://127.0.0.1:${server.port}',
    );

    final reply = await assistant.ask(
      message: 'What is next?',
      context: const [
        {'id': 'task:t1', 'kind': 'task', 'freshness': 'current'},
      ],
    );

    await requestSeen;
    expect(reply.answer, 'You have one task due tomorrow.');
    expect(reply.toolResults, hasLength(1));
    await server.close(force: true);
  });

  test('does not hide backend failures behind a success answer', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final requestSeen = server.first.then((request) async {
      request.response
        ..statusCode = HttpStatus.serviceUnavailable
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({'detail': 'Groq rate limit reached.'}));
      await request.response.close();
    });
    final assistant = GroqAssistant(
      baseUrl: 'http://127.0.0.1:${server.port}',
    );

    await expectLater(
      assistant.ask(message: 'Help', context: const []),
      throwsA(isA<GroqUnavailable>()),
    );
    await requestSeen;
    await server.close(force: true);
  });
}
