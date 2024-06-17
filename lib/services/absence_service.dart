import 'package:flutter_application_1/models/absence.model.dart';
import 'package:flutter_application_1/repositories/absence.repository.dart';
import 'package:flutter_application_1/shared/json_data.dart';

class AbsenceService {
  final AbsenceRepository absenceRepository = AbsenceRepository();

  Future<List<Absence>> getAllAbsences() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    
    final List<dynamic> absenceData = jsonData['absences'];
    return absenceData.map((json) => Absence.fromJson(json)).toList();
  }
  Future<void> submitJustification(String absenceId, String justification) async {
    await Future.delayed(Duration(seconds: 1));
    var absence = absenceRepository.getAbsenceById(absenceId);
    absence['justification'] = justification;
    absenceRepository.updateAbsence(absence);
  }

  Future<void> processJustification(String absenceId, bool isAccepted) async {
    await Future.delayed(Duration(seconds: 1));
    var absence = absenceRepository.getAbsenceById(absenceId);
    absence['isAccepted'] = isAccepted;
    if (!isAccepted) {
      absence['justification'] = null;
    }
    absenceRepository.updateAbsence(absence);
  }
}
