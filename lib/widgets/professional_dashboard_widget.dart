
import 'package:flutter/material.dart';

class ProfessionalDashboardWidget extends StatelessWidget {
  const ProfessionalDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.business_center),
        title: Text('Meetings'),
        subtitle: Text('You have 2 meetings scheduled for today.'),
      ),
    );
  }
}
