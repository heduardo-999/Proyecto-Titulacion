import 'package:flutter/material.dart';

class HorariosPage extends StatelessWidget {
  final List<String> schedule = [
    '9:00 AM - Matemáticas',
    '10:00 AM - Historia',
    '11:00 AM - Ciencias',
    '1:00 PM - Lengua',
    '3:00 PM - Deportes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Horario")),
      body: ListView.builder(
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(schedule[index]),
          );
        },
      ),
    );
  }
}
