import 'package:flutter/material.dart';

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {

  void _showNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Esto es un mensaje de notificación.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notificaciones")),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: Text('Mostrar Notificación'),
        ),
      ),
    );
  }
}
