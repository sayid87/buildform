import 'package:buildform/BuildForm.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SafeArea(child: MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Building"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const BuildForm()));
            },
            child: const Text('Halaman Build Form')),
      ),
    );
  }
}
