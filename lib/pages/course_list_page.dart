import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/course_detail_page.dart';
import 'package:provider/provider.dart';
import '../providers/course.provider.dart';
class CourseListPage extends StatefulWidget {
  static String routeName = "/courses";

  const CourseListPage({Key? key}) : super(key: key);

  @override
  _CourseListPageState createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  @override
  void initState() {
    super.initState();
    // Load the courses when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseProvider>(context, listen: false).loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Courses List",
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