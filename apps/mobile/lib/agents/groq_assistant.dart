import 'dart:async';
import 'dart:convert';
import 'dart:io';

class GroqAssistantReply {
  const GroqAssistantReply({required this.answer, required this.toolResults});

  final String answer;
  final List<Object?> toolResults;
}

/// Calls NIVA's trusted backend only; no Groq credential is accepted by mobile.
class GroqAssistant {
  GroqAssistant({HttpClient? client, String? baseUrl})
      : _client = client ?? HttpClient(),
        _baseUrl = baseUrl ?? const String.fromEnvironment('NIVA_BACKEND_URL'),
        _developmentToken = const String.fromEnvironment('NIVA_BACKEND_TOKEN');

  final HttpClient _client;
  final String _baseUrl;
  final String _developmentToken;

  bool get isConfigured => _baseUrl.trim().isNotEmpty;

  Future<GroqAssistantReply> ask({
    required String message,
    required List<Map<String, Object?>> context,
  }) async {
    if (!isConfigured) {
      throw const GroqUnavailable('Groq backend is not configured.');
    }
    final uri = Uri.parse(_baseUrl).resolve('/v1/conversation');
    try {
      final request =
          await _client.postUrl(uri).timeout(const Duration(seconds: 4));
      request.headers.contentType = ContentType.json;
      if (_developmentToken.isNotEmpty) {
        request.headers
            .set(HttpHeaders.authorizationHeader, 'Bearer $_developmentToken');
      }
      request.add(
          utf8.encode(jsonEncode({'message': message, 'context': context})));
      final response =
          await request.close().timeout(const Duration(seconds: 14));
      final payload = jsonDecode(await response
          .transform(utf8.decoder)
          .join()
          .timeout(const Duration(seconds: 3)));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        final detail = payload is Map ? payload['detail']?.toString() : null;
        throw GroqUnavailable(
            detail ?? 'Groq backend returned HTTP ${response.statusCode}.');
      }
      if (payload is! Map || payload['answer'] is! String) {
        throw const GroqUnavailable(
            'Groq backend returned an invalid response.');
      }
      final results = payload['tool_results'];
      return GroqAssistantReply(
        answer: payload['answer'] as String,
        toolResults: results is List ? results.cast<Object?>() : const [],
      );
    } on GroqUnavailable {
      rethrow;
    } on TimeoutException {
      throw const GroqUnavailable(
          'Groq request timed out. Your local planner is still available.');
    } on SocketException {
      throw const GroqUnavailable(
          'Groq backend is unreachable. Your local planner is still available.');
    } on HttpException {
      throw const GroqUnavailable(
          'Groq backend could not complete the request. Your local planner is still available.');
    } on FormatException {
      throw const GroqUnavailable('Groq backend returned malformed data.');
    }
  }
}

class GroqUnavailable implements Exception {
  const GroqUnavailable(this.message);
  final String message;
  @override
  String toString() => message;
}
