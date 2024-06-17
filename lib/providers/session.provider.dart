import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/session.model.dart';
import 'package:flutter_application_1/services/filter_service.dart';
import 'package:flutter_application_1/services/session_service.dart';



class SessionProvider with ChangeNotifier {
  List<Session> _sessions = [];
  bool _isLoading = false;
  final SessionService _sessionService;
  final FilterService _filterService;

  SessionProvider(this._sessionService, this._filterService);

  List<Session> get sessions => _sessions;
  bool get isLoading => _isLoading;

  Future<void> fetchSessions() async {
    _isLoading = true;
    notifyListeners();

    _sessions = await _sessionService.getAllSessions();
    
    _isLoading = false;
    notifyListeners();
  }

  List<Session> filterSessionsByPeriod(DateTime startDate, DateTime endDate) {
    return _filterService.filterSessionsByPeriod(_sessions, startDate, endDate);
  }

  List<Session> filterSessionsByModule(String moduleId) {
    return _filterService.filterSessionsByModule(_sessions, moduleId);
  }
}
