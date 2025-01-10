import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatabankPage(),
    );
  }
}

class DatabankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
        currentIndex: 0,
        elevation: 8,
        iconSize: 24,
        selectedItemColor: Color(0xff3a57e8),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: 130,
                    child: Placeholder(), // Substituição para a imagem
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                    color: const Color(0xff212435),
                    iconSize: 24,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Global recordings",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Placeholder(), // Substituição para a imagem
              ),
              const SizedBox(height: 20),
              buildSearchField(
                label: "Search speaker",
                hint: "Enter Text",
                onTapSearch: () {},
              ),
              const SizedBox(height: 10),
              buildSearchField(
                label: "Search language",
                hint: "Enter Text",
                onTapSearch: () {},
              ),
              const SizedBox(height: 10),
              buildSearchField(
                label: "Search recording",
                hint: "Enter Text",
                onTapSearch: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchField({
    required String label,
    required String hint,
    required VoidCallback onTapSearch,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              filled: true,
              fillColor: const Color(0xfff2f2f3),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: onTapSearch,
          color: const Color(0xff212435),
          iconSize: 24,
        ),
      ],
    );
  }
}
