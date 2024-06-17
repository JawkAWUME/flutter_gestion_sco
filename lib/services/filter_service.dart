
import 'package:flutter_application_1/models/absence.model.dart';
import 'package:flutter_application_1/models/cours.model.dart';
import 'package:flutter_application_1/models/session.model.dart';
import 'package:flutter_application_1/shared/json_data.dart';

class FilterService {
  List<Course> filterCoursesByPeriod(List<Course> courses, DateTime startDate, DateTime endDate) {
    return courses.where((course) {
      return course.sessions.any((sessionId) {
        var session = jsonData['sessions'].firstWhere((json) => json['id'] == sessionId);
        DateTime sessionDate = DateTime.parse(session['date']);
        return sessionDate.isAfter(startDate) && sessionDate.isBefore(endDate);
      });
    }).toList();
  }

  List<Session> filterSessionsByPeriod(List<Session> sessions, DateTime startDate, DateTime endDate) {
    return sessions.where((session) {
      DateTime sessionDate = session.date;
      return sessionDate.isAfter(startDate) && sessionDate.isBefore(endDate);
    }).toList();
  }

  List<Session> filterSessionsByModule(List<Session> sessions, String moduleId) {
    return sessions.where((session) {
      var course = jsonData['courses'].firstWhere((json) => json['id'] == session.courseId);
      return course['module'] == moduleId;
    }).toList();
  }

  List<Absence> filterAbsencesByPeriod(List<Absence> absences, DateTime startDate, DateTime endDate) {
    return absences.where((absence) {
      DateTime absenceDate = absence.date;
      return absenceDate.isAfter(startDate) && absenceDate.isBefore(endDate);
    }).toList();
  }
}
