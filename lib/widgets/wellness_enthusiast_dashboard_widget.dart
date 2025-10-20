
import 'package:flutter/material.dart';

class WellnessEnthusiastDashboardWidget extends StatelessWidget {
  const WellnessEnthusiastDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.spa),
        title: Text('Meditation'),
        subtitle: Text('Time for your daily 10-minute meditation.'),
      ),
    );
  }
}
