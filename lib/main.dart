
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mongo_dart/mongo_dart.dart' hide State, Center;
import 'models/models.dart';
import 'persona_selection_screen.dart'; // Import the new screen

// Placeholder for database connection details
const String dbConnectionSting = "mongodb+srv://speakaceuser:kwPF0Z2T7X2SF8EE1@cluster0.8uuoyy6.mongodb.net/speak-ace?retryWrites=true&w=majority&appName=Cluster0";
const String dbName = "speak-ace";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DatabaseService(),
      child: const MyApp(),
    ),
  );
}

class DatabaseService with ChangeNotifier {
  Db? _db;
  DbCollection? _usersCollection;

  Future<void> connect() async {
    try {
      _db = await Db.create(dbConnectionSting);
      await _db!.open();
      _usersCollection = _db!.collection('users');
      notifyListeners();
    } catch (e) {
      debugPrint('Error connecting to database: $e');
    }
  }

  Future<List<User>> getUsers() async {
    if (_usersCollection == null) {
      return [];
    }
    final users = await _usersCollection!.find().toList();
    return users.map((json) => User.fromJson(json)).toList();
  }

  Future<void> updateUserPersona(String persona) async {
    if (_usersCollection == null) {
      return;
    }
    try {
      await _usersCollection!.insertOne({
        'email': 'user@example.com', // Placeholder
        'persona': persona,
      });
      debugPrint('User persona updated to: $persona');
    } catch (e) {
      debugPrint('Error updating user persona: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak-Ace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DatabaseService>(context, listen: false).connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Speak-Ace',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your personal AI-powered routine planner.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonaSelectionScreen()),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
