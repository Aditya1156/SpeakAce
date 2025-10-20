
import 'package:flutter/material.dart';

class StudentDashboardWidget extends StatelessWidget {
  const StudentDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.menu_book),
        title: Text('Homework'),
        subtitle: Text('You have 3 assignments due this week.'),
      ),
    );
  }
}
