import 'package:flutter/material.dart';
import 'screens/list_contacts_screen.dart';
import 'screens/grid_gallery_screen.dart';
import 'screens/shared_pref_screen.dart';
import 'screens/async_user_screen.dart';
import 'screens/factorial_isolate_screen.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Exercises",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ("ListView Contacts", const ListContactsScreen()),
      ("GridView Gallery", const GridGalleryScreen()),
      ("Shared Preferences", const SharedPrefScreen()),
      ("Async Programming", const AsyncUserScreen()),
      ("Factorial Isolate", const FactorialIsolateScreen()),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Exercises")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(items[i].$1),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => items[i].$2)),
        ),
      ),
    );
  }
}
