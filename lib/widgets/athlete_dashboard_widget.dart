
import 'package:flutter/material.dart';

class AthleteDashboardWidget extends StatelessWidget {
  const AthleteDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.fitness_center),
        title: Text('Workout'),
        subtitle: Text('Your next workout is a 5k run.'),
      ),
    );
  }
}
