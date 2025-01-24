import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Ayvu', style: Theme.of(context).textTheme.titleLarge,),
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Help us make a better AYVU!",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            "The Ayvu Project consists of a set of tools that collect language data through audio recordings and a geographic reference of where the person acquired a particular way of communicating. Available through a mobile application, Ayvu enables individuals with no prior technological knowledge to access and use these utilities.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          _buildActionButton(context, "Visit our Github"),
          _buildActionButton(context, "Visit the devs socials"),
          _buildActionButton(context, "Report a bug"),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        onPressed: () {
          // Ação do botão
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
