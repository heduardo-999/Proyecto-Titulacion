import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _faq = [
    {'question': 'inscripciones', 'answer': 'Las inscripciones se realizan en el portal oficial del IPN.'},
    {'question': 'ubicación de salones', 'answer': 'Consulta el mapa del campus para encontrar la ubicación de los salones.'},
    {'question': 'horarios', 'answer': 'Los horarios están disponibles en tu perfil de usuario.'},
    {'question': 'materias', 'answer': 'Las materias pueden consultarse en la sección de tu perfil académico.'},
    {'question': 'eventos', 'answer': 'Revisa la sección de Eventos en la pantalla principal.'},
    {'question': 'guías de uso', 'answer': 'Para usar la app, selecciona una opción en el menú principal.'},
  ];

  final List<String> _messages = [
    'Chatbot: Hola, ¿en qué puedo ayudarte hoy? Selecciona una de las opciones a continuación o escribe tu consulta.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _messages[index],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Selecciona una opción o escribe tu consulta:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: _faq.map((entry) {
                    return ElevatedButton(
                      onPressed: () {
                        _handleOptionSelected(entry['question']!);
                      },
                      child: Text(entry['question']!),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Escribe tu mensaje',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _handleUserInput(_controller.text);
                      },
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleOptionSelected(String option) {
    setState(() {
      _messages.add('Usuario: $option');
      String response = _faq.firstWhere((entry) => entry['question'] == option)['answer']!;
      _messages.add('Chatbot: $response');
    });
  }

  void _handleUserInput(String input) {
    if (input.isEmpty) return;
    setState(() {
      _messages.add('Usuario: $input');
      _controller.clear();

      String response = _faq.firstWhere(
            (entry) => input.toLowerCase().contains(entry['question']!),
        orElse: () => {'answer': 'Lo siento, no entendí tu consulta. Por favor intenta nuevamente.'},
      )['answer']!;

      _messages.add('Chatbot: $response');
    });
  }
}
