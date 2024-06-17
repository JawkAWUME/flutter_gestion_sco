import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/cours.model.dart';
import 'package:flutter_application_1/repositories/cours.repository.dart';
class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];
  bool _isLoading = false;

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;

  final CourseRepository courseRepository;

  CourseProvider({required this.courseRepository});

  Future<void> loadCourses() async {
    _isLoading = true;
    notifyListeners();

    _courses = await courseRepository.fetchCourses();
    _isLoading = false;
    notifyListeners();
  }

  List<Course> filterCoursesByPeriod(DateTime startDate, DateTime endDate) {
    return _courses.where((course) {
      return course.sessions.any((session) {
        DateTime sessionDate = session.date;
        return sessionDate.isAfter(startDate) && sessionDate.isBefore(endDate);
      });
    }).toList();
  }
}