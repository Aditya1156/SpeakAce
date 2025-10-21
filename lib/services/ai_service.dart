
import 'package:firebase_ai/firebase_ai.dart';

class AIService {
  final FirebaseVertexAI _vertexAI;

  AIService({FirebaseVertexAI? vertexAI}) : _vertexAI = vertexAI ?? FirebaseVertexAI.instance;

  Future<String> generateRoutine(String persona) async {
    final model = _vertexAI.generativeModel(model: 'gemini-1.5-flash');
    final prompt = 'Create a personalized daily routine for a $persona. The routine should include at least 4-5 tasks with specific times and relevant icons.';

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      return response.text ?? 'Could not generate a routine at this time.';
    } catch (e) {
      return 'Error generating routine: $e';
    }
  }
}
