// lib/services/gemini_service.dart
import 'package:google_generative_ai/google_generative_ai.dart';
import '../constants.dart';

class GeminiService {
  late GenerativeModel model;
  late ChatSession chat;

  GeminiService() {
    model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: Constants.apiKey,
    );
    chat = model.startChat();
  }

  Future<String> sendMessage(String message) async {
    try {
      final response = await chat.sendMessage(Content.text(message));
      return response.text ?? 'No response';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
