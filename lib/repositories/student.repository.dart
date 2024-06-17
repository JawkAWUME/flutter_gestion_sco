import 'package:flutter_application_1/shared/json_data.dart';

class StudentRepository {
  List<Map<String, dynamic>> getAllStudents() {
    return jsonData['students'];
  }

  Map<String, dynamic> getStudentById(String studentId) {
    return jsonData['students']
        .firstWhere((student) => student['id'] == studentId);
  }
}
