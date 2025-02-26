import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_titulacion/pages/perfil_page.dart';
import 'package:app_titulacion/pages/eventos_page.dart';
import 'package:app_titulacion/pages/chatbot_page.dart';
import 'package:app_titulacion/pages/calendario_page.dart';
import 'package:app_titulacion/pages/horarios_page.dart';
import 'package:app_titulacion/pages/notificaciones_page.dart';
import 'package:app_titulacion/pages/materias_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Esime Culhuacan App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 🔹 Lista de imágenes funcionales en línea
  final List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIfNQmvVVSexCt9ObwT956wkwz_vjYYfwSuQ&s/800x400/?technology,school',
    'https://oem.com.mx/elsoldemexico/img/16568511/1453573564/BASE_LANDSCAPE/480/image.webp/800x400/?students,classroom',
    'https://palabrasabiertas.home.blog/wp-content/uploads/2019/12/images-8.jpg?w=560/800x400/?university,books',
    'https://www.jornada.com.mx/ndjsimg/images/jornada/jornadaimg/renuncia-director-de-esime-culhuacan-hector-becerril-mendoza-1919/2-18-renuncia-director-de-esime-culhuacan-hector-becerril-mendoza-1919html-esimepng-6002html-78c9f930-3b77-4aa5-a614-f7a8fa1421dc.pngrawimage=true/800x400/?education,learning'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.school,
                color: Colors.white,
                size: 40,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  fillColor: const Color.fromARGB(255, 44, 44, 44),
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          
          // 🔹 CarouselSlider con imágenes de Internet
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              height: 200,
            ),
            items: images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.error, color: Colors.black, size: 50),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              children: [
                _buildMenuItem(
                  context,
                  'Eventos',
                  Icons.event,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventosPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Chatbot',
                  Icons.chat,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatbotPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Calendario IPN',
                  Icons.calendar_today,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarioPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Horarios',
                  Icons.schedule,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HorariosPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Notificaciones',
                  Icons.notifications,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificacionesPage()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  'Materias',
                  Icons.book,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MateriasPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 29, 29, 29),
        margin: EdgeInsets.all(10),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
