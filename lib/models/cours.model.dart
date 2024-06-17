
import 'package:flutter_application_1/models/session.model.dart';
import 'package:flutter_application_1/shared/json_data.dart';

class Course {
  final String id;
  final String title;
  final String module;
  final String professor;
  final int quota;
  final List<Session> sessions;

  Course({
    required this.id,
    required this.title,
    required this.module,
    required this.professor,
    required this.quota,
    required this.sessions,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['name'],
      module: json['module'],
      professor: json['professor'] ?? 'Unknown', // Assuming professor is not in the JSON and added manually or from another data source
      quota: json['quota'],
      sessions: (json['sessions'] as List<dynamic>).map((sessionId) {
        // Fetch session details from session repository or jsonData
        final sessionJson = jsonData['sessions'].firstWhere((session) => session['id'] == sessionId);
        return Session.fromJson(sessionJson);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'module': module,
      'professor': professor,
      'quota': quota,
      'sessions': sessions.map((session) => session.toJson()).toList(),
    };
  }
}
