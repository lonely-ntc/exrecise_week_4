import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../utils/factorial.dart';

class FactorialIsolateScreen extends StatefulWidget {
  const FactorialIsolateScreen({Key? key}) : super(key: key);

  @override
  _FactorialIsolateScreenState createState() => _FactorialIsolateScreenState();
}

class _FactorialIsolateScreenState extends State<FactorialIsolateScreen> {
  final TextEditingController _controller = TextEditingController();
  String resultText = "";
  bool isLoading = false;

  Future<void> _calculate() async {
    final int? n = int.tryParse(_controller.text);

    if (n == null || n < 0) {
      setState(() {
        resultText = "Vui lòng nhập số nguyên dương!";
      });
      return;
    }

    setState(() {
      isLoading = true;
      resultText = "";
    });

    // Tính factorial trên isolate
    BigInt result = await compute(calculateFactorial, n);

    setState(() {
      isLoading = false;

      // Hiển thị số lượng chữ số để tránh GIẬT app
      resultText = "🔢 ${n}! có ${result.toString().length} chữ số:\n\n$result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Factorial Isolate")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Nhập số n ",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: isLoading ? null : _calculate,
              child: const Text("Tính n!"),
            ),
            
            const SizedBox(height: 16),

            if (isLoading)
              const CircularProgressIndicator(),

            Expanded(
              child: SingleChildScrollView(
                child: Text(resultText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
