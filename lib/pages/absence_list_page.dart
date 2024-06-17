import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../providers/absence.provider.dart';
class AbsenceListPage extends StatefulWidget {
  static String routeName = "/absences";

  const AbsenceListPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AbsenceListPageState createState() => _AbsenceListPageState();
}

class _AbsenceListPageState extends State<AbsenceListPage> {
  @override
  void initState() {
    super.initState();
    // Load the courses when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AbsenceProvider>(context, listen: false).fetchAbsences();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absences')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
                  "Absences List",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Consumer<AbsenceProvider>(
                builder: (context, absenceProvider, child) {
                  if (absenceProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (absenceProvider.absences.isEmpty) {
                    return const Center(child: Text('No absences available.'));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: absenceProvider.absences.length,
                    itemBuilder: (context, index) {
                      final absence = absenceProvider.absences[index];
                      return ListTile(
                        title: Text('Absence ${index + 1}'),
                        subtitle: Text('Date: ${absence.date}, Justification: ${absence.justification}'),
                        onTap: () {
                          // Navigate to absence detail page if needed
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

