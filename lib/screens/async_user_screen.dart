import 'package:flutter/material.dart';

class AsyncUserScreen extends StatefulWidget {
  const AsyncUserScreen({super.key});

  @override
  State<AsyncUserScreen> createState() => _AsyncUserScreenState();
}

class _AsyncUserScreenState extends State<AsyncUserScreen> {
  String status = "Loading user...";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => status = "User loaded successfully!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Async Example")),
      body: Center(
        child: Text(status, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
