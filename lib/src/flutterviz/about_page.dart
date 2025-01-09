import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _currentIndex = 0; // Índice da aba selecionada

  // Lista de páginas associadas a cada aba
  final List<Widget> _pages = [
    HomePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Ayvu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_currentIndex], // Mostra a página correspondente
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff3a57e8),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        elevation: 8,
      ),
    );
  }
}

// Página de exemplo para "Home"
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Help us make a better AYVU!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "The Ayvu Project consists of a set of tools that collect language data through audio recordings and a geographic reference of where the person acquired a particular way of communicating. Available through a mobile application, Ayvu enables individuals with no prior technological knowledge to access and use these utilities.",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          SizedBox(height: 20),
          _buildActionButton(context, "Visit our Github"),
          _buildActionButton(context, "Visit the devs socials"),
          _buildActionButton(context, "Report a bug"),
        ],
      ),
    );
  }

  // Botão reutilizável
  Widget _buildActionButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color(0xff808080)),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}

// Página de exemplo para "Account"
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Account Page",
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}