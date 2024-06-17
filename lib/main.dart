import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cours.model.dart';
import 'package:flutter_application_1/pages/absence_list_page.dart';
import 'package:flutter_application_1/pages/course_detail_page.dart';
import 'package:flutter_application_1/pages/course_list_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/session_list_page.dart';
import 'package:flutter_application_1/providers/course.provider.dart';
import 'package:flutter_application_1/repositories/cours.repository.dart';
import 'package:flutter_application_1/services/absence_service.dart';
import 'package:flutter_application_1/services/filter_service.dart';
import 'package:flutter_application_1/services/session_service.dart';
import 'package:provider/provider.dart';
import 'providers/session.provider.dart';
import 'providers/absence.provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CourseRepository courseRepository = CourseRepository();
  final SessionService sessionService = SessionService();
  final AbsenceService absenceService = AbsenceService();
  final FilterService filterService = FilterService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CourseProvider(courseRepository: courseRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => SessionProvider(sessionService, filterService),
        ),
        ChangeNotifierProvider(
          create: (_) => AbsenceProvider(absenceService,filterService),
        ),
      ],
      child: MaterialApp(
        title: 'Gestion Pédagogique à ISM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(),
        routes: {
          '/courses': (context) => const CourseListPage(),
          '/sessions': (context) => const SessionListPage(),
          '/absences': (context) => const AbsenceListPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/courseDetail') {
            final course = settings.arguments as Course;
            return MaterialPageRoute(
              builder: (context) => CourseDetailPage(course: course),
            );
          }
          return null;
        },
      ),
    );
  }
}