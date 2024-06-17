import 'package:flutter_application_1/repositories/session.repository.dart';

class StudentService {
  final SessionRepository sessionRepository = SessionRepository();

  Future<void> markPresence(String sessionId, String studentId) async {
    await Future.delayed(Duration(seconds: 1));
    var session = sessionRepository.getSessionById(sessionId);
    if (session['attendances'] == null) {
      session['attendances'] = [];
    }
    session['attendances'].add(studentId);
    sessionRepository.updateSession(session);
  }

  Future<void> validatePresence(String sessionId, String studentId) async {
    await Future.delayed(Duration(seconds: 1));
    var session = sessionRepository.getSessionById(sessionId);
    if (session['validatedAttendances'] == null) {
      session['validatedAttendances'] = [];
    }
    session['validatedAttendances'].add(studentId);
    sessionRepository.updateSession(session);
  }
}
