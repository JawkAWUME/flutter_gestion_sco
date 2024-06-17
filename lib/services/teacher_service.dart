import 'package:flutter_application_1/shared/json_data.dart';

class TeacherService {
  int getTotalHours(String teacherId) {
    int totalHours = 0;
    for (var session in jsonData['sessions']) {
      if (session['teacherId'] == teacherId) {
        totalHours += int.parse(session['duration']);
      }
    }
    return totalHours;
  }

  int getRemainingHours(String courseId) {
    var course = jsonData['courses'].firstWhere((json) => json['id'] == courseId);
    int quota = course['quota'];
    int usedHours = 0;
    for (var sessionId in course['sessions']) {
      var session = jsonData['sessions'].firstWhere((json) => json['id'] == sessionId);
      usedHours += int.parse(session['duration']);
    }
    return quota - usedHours;
  }
}
