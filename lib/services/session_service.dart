
import 'package:flutter_application_1/models/session.model.dart';
import 'package:flutter_application_1/repositories/session.repository.dart';
import 'package:flutter_application_1/shared/json_data.dart';

class SessionService {
  final SessionRepository sessionRepository = SessionRepository();

  Future<List<Session>> getAllSessions() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    
    final List<dynamic> sessionData = jsonData['sessions'];
    return sessionData.map((json) => Session.fromJson(json)).toList();
  }
   
  Future<void> validateSession(String sessionId) async {
    await Future.delayed(Duration(seconds: 1));
    var session = sessionRepository.getSessionById(sessionId);
    session['isValidated'] = true;
    sessionRepository.updateSession(session);
  }

  Future<void> invalidateSession(String sessionId) async {
    await Future.delayed(Duration(seconds: 1));
    var session = sessionRepository.getSessionById(sessionId);
    session['isValidated'] = false;
    sessionRepository.updateSession(session);
  }
}
