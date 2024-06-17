import 'package:flutter_application_1/shared/json_data.dart';

class AbsenceRepository {
  List<Map<String, dynamic>> getAllAbsences() {
    return jsonData['absences'];
  }

  List<Map<String, dynamic>> getAbsencesByStudentId(String studentId) {
    return jsonData['absences']
        .where((absence) => absence['studentId'] == studentId)
        .toList();
  }

  Map<String, dynamic> getAbsenceById(String absenceId) {
    return jsonData['absences']
        .firstWhere((absence) => absence['id'] == absenceId);
  }

  void updateAbsence(Map<String, dynamic> updatedAbsence) {
    var index = jsonData['absences'].indexWhere(
      (absence) => absence['id'] == updatedAbsence['id'],
    );
    if (index != -1) {
      jsonData['absences'][index] = updatedAbsence;
    }
  }
}
