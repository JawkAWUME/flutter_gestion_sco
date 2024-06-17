import 'package:flutter_application_1/models/cours.model.dart';
import 'package:flutter_application_1/shared/json_data.dart';

class CourseRepository {
 Future<List<Course>> fetchCourses() async {
    // Simuler un délai pour imiter un appel réseau
    await Future.delayed(Duration(seconds: 2));
    final List<dynamic> courseData = jsonData['courses'];
    return courseData.map((json) => Course.fromJson(json)).toList();
  }
}

