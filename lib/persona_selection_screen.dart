
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'dashboard_screen.dart';

class PersonaSelectionScreen extends StatelessWidget {
  const PersonaSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tell Us About Yourself', style: GoogleFonts.lato()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Choose a persona that best describes you:",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildPersonaCard(
              context,
              icon: Icons.school,
              title: 'Student',
              description: 'For those focused on learning and exams.',
            ),
            const SizedBox(height: 20),
            _buildPersonaCard(
              context,
              icon: Icons.work,
              title: 'Professional',
              description: 'For the career-oriented and goal-driven.',
            ),
            const SizedBox(height: 20),
            _buildPersonaCard(
              context,
              icon: Icons.fitness_center,
              title: 'Athlete',
              description: 'For individuals tracking fitness and performance.',
            ),
            const SizedBox(height: 20),
            _buildPersonaCard(
              context,
              icon: Icons.self_improvement,
              title: 'Wellness Enthusiast',
              description: 'For those prioritizing mental and physical well-being.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonaCard(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () async {
          await Provider.of<DatabaseService>(context, listen: false).updateUserPersona(title);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    Text(description, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
