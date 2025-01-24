import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecordingPage(),
    );
  }
}

class RecordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtém o tema atual para usar as cores padrão

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload your recording!'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Ação para voltar
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recording time: 0.00",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Max: 1 hour",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Image.network(
              "https://picsum.photos/250?image=9",
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                // Lógica para iniciar/parar a gravação
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.6,
                  MediaQuery.of(context).size.height * 0.12,
                ),
              ),
              child: const Text(
                "Record Now",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Click to start/stop Recording",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
