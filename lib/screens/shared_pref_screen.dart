import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({super.key});

  @override
  State<SharedPrefScreen> createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  String result = " Enter data & Save";

  @override
  void initState() {
    super.initState();
    loadDataOnStart();  // 🔥 AUTO LOAD
  }

  Future<void> loadDataOnStart() async {
    final user = await StorageService.loadUser();
    if (user["name"] != null) {
      setState(() {
        result = formatUser(user);
      });
    }
  }

  String formatUser(Map<String, dynamic> user) {
    return """
 Name : ${user["name"]}
 Age  : ${user["age"]}
 Email: ${user["email"]}
 Last Save: ${user["timestamp"]}
""";
  }

  Future<void> saveUser() async {
    if (nameCtrl.text.isEmpty ||
        ageCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty) {
      setState(() => result = " Please enter all fields!");
      return;
    }

    await StorageService.saveUser(
      name: nameCtrl.text,
      age: int.parse(ageCtrl.text),
      email: emailCtrl.text,
    );

    final user = await StorageService.loadUser();
    setState(() => result = formatUser(user));
  }

  Future<void> showUser() async {
    final user = await StorageService.loadUser();
    if (user["name"] == null) {
      setState(() => result = "ℹ️ No saved user data found");
    } else {
      setState(() => result = formatUser(user));
    }
  }

  Future<void> clearUser() async {
    await StorageService.clear();
    setState(() => result = "🗑️ All saved data cleared!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences (Persistent)"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "Enter Name"),
            ),
            TextField(
              controller: ageCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter Age"),
            ),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: "Enter Email"),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: saveUser, child: const Text("Save")),
                ElevatedButton(onPressed: showUser, child: const Text("Show")),
                ElevatedButton(
                  onPressed: clearUser,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Clear"),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
