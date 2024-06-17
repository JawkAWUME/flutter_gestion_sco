import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/session.provider.dart';
class SessionListPage extends StatelessWidget {
  static String routeName = "/sessions";

  const SessionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sessions')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Sessions List",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Consumer<SessionProvider>(
                builder: (context, sessionProvider, child) {
                  if (sessionProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (sessionProvider.sessions.isEmpty) {
                    return const Center(child: Text('No sessions available.'));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sessionProvider.sessions.length,
                    itemBuilder: (context, index) {
                      final session = sessionProvider.sessions[index];
                      return ListTile(
                        title: Text('Session ${index + 1}'),
                        subtitle: Text('Date: ${session.date}, Duration: ${session.duration}h'),
                        onTap: () {
                          // Navigate to session detail page if needed
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