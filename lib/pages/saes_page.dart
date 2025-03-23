import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:app_titulacion/main.dart';

class Saes extends StatelessWidget {
  const Saes({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("Cargando: $progress%");
          },
          onPageStarted: (String url) {
            debugPrint("Cargando URL: $url");
          },
          onPageFinished: (String url) {
            debugPrint("Página terminada de cargar: $url");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("Error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse("https://www.saes.esimecu.ipn.mx/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saes"),
        backgroundColor: Colors.black, // Fondo negro
        foregroundColor: Colors.white, // Texto y botones blancos
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
