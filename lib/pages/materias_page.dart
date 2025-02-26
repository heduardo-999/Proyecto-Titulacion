import 'package:flutter/material.dart';

class MateriasPage extends StatelessWidget {
  final List<String> subjects = [
    'Matemáticas',
    'Historia',
    'Ciencias',
    'Lengua',
    'Deportes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Materias")),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subjects[index]),
          );
        },
      ),
    );
  }
}
