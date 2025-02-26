import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendario")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          onDaySelected: (selectedDay, focusedDay) {
            print("Día seleccionado: $selectedDay");
          },
        ),
      ),
    );
  }
}
