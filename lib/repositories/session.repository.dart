import 'package:flutter_application_1/shared/json_data.dart';

class SessionRepository {
  List<Map<String, dynamic>> getAllSessions() {
    return jsonData['sessions'];
  }

  List<Map<String, dynamic>> getSessionsByCourseId(String courseId) {
    return jsonData['sessions']
        .where((session) => session['courseId'] == courseId)
        .toList();
  }

  Map<String, dynamic> getSessionById(String sessionId) {
    return jsonData['sessions']
        .firstWhere((session) => session['id'] == sessionId);
  }

  void updateSession(Map<String, dynamic> updatedSession) {
    var index = jsonData['sessions'].indexWhere(
      (session) => session['id'] == updatedSession['id'],
    );
    if (index != -1) {
      jsonData['sessions'][index] = updatedSession;
    }
  }
}

