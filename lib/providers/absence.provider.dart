import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/absence.model.dart';
import 'package:flutter_application_1/services/absence_service.dart';
import 'package:flutter_application_1/services/filter_service.dart';


class AbsenceProvider with ChangeNotifier {
  List<Absence> _absences = [];
  bool _isLoading = false;
  final AbsenceService _absenceService;
  final FilterService _filterService;

  AbsenceProvider(this._absenceService, this._filterService);

  List<Absence> get absences => _absences;
  bool get isLoading => _isLoading;

  Future<void> fetchAbsences() async {
    _isLoading = true;
    notifyListeners();

    _absences = await _absenceService.getAllAbsences();
    
    _isLoading = false;
    notifyListeners();
  }

  List<Absence> filterAbsencesByPeriod(DateTime startDate, DateTime endDate) {
    return _filterService.filterAbsencesByPeriod(_absences, startDate, endDate);
  }
}
