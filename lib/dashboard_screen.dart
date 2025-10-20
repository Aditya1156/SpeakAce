
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'models/models.dart';
import 'theme_provider.dart';
import 'widgets/student_dashboard_widget.dart';
import 'widgets/professional_dashboard_widget.dart';
import 'widgets/athlete_dashboard_widget.dart';
import 'widgets/wellness_enthusiast_dashboard_widget.dart';
import 'widgets/timeline_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await Provider.of<DatabaseService>(context, listen: false).getCurrentUser();
    setState(() {
      _user = user;
    });
  }

  Widget _getPersonaWidget(String? persona) {
    switch (persona) {
      case 'Student':
        return const StudentDashboardWidget();
      case 'Professional':
        return const ProfessionalDashboardWidget();
      case 'Athlete':
        return const AthleteDashboardWidget();
      case 'Wellness Enthusiast':
        return const WellnessEnthusiastDashboardWidget();
      default:
        return const SizedBox(); // Return an empty widget if persona is unknown
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Dashboard'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: _user == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  'Welcome, ${_user!.persona}!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                _getPersonaWidget(_user!.persona),
                const SizedBox(height: 20),
                const TimelineWidget(),
              ],
            ),
    );
  }
}
