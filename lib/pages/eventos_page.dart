import 'package:flutter/material.dart';

class EventosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los eventos del IPN.',
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
