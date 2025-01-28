import 'package:ayvu_app/src/widgets/about_page.dart';
import 'package:ayvu_app/src/widgets/my_recs_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SidePanel(),
    );
  }
}

class SidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildMenuItem(
              context,
              icon: Icons.account_circle,
              label: "My profile",
              onTap: () {},
            ),
            _buildMenuItem(
              context,
              icon: Icons.keyboard_voice,
              label: "My recordings",
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRecsPage(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings,
              label: "Settings",
              onTap: () {},
            ),
            _buildMenuItem(
              context,
              icon: Icons.code,
              label: "About devs",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: onTap,
            color: Theme.of(context).colorScheme.primary,
            iconSize: 50,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
