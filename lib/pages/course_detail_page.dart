import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cours.model.dart';


class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Module: ${course.module}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Professor: ${course.professor}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Quota: ${course.quota}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Sessions:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: course.sessions.length,
                itemBuilder: (context, index) {
                  final session = course.sessions[index];
                  return ListTile(
                    title: Text('Session ${index + 1}'),
                    subtitle: Text('Date: ${session.date}, Duration: ${session.duration}h'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
