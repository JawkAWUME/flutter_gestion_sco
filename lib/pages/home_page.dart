import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/absence_list_page.dart';
import 'package:flutter_application_1/pages/course_detail_page.dart';
import 'package:flutter_application_1/pages/course_list_page.dart';
import 'package:flutter_application_1/pages/session_list_page.dart';
import 'package:flutter_application_1/providers/course.provider.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, HomePage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Courses'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, CourseListPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Sessions'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SessionListPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Absences'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AbsenceListPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Welcome to the Educational Management App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Consumer<CourseProvider>(
                builder: (context, courseProvider, child) {
                  if (courseProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  print(courseProvider.courses);
                      if (courseProvider.courses.isEmpty) {
                    return const Center(child: Text('No courses available.'));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courseProvider.courses.length,
                    itemBuilder: (context, index) {
                      final course = courseProvider.courses[index];
                      return ListTile(
                        title: Text(course.title),
                        subtitle: Text('Module: ${course.module} - Prof: ${course.professor}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailPage(course: course),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}