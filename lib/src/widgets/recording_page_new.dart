import 'package:ayvu_app/src/widgets/send_recording_page.dart';
import 'package:flutter/material.dart';

class RecordingPageNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtém o tema atual para usar as cores padrão

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload your recording!'),
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                //Lógica de armazenamento, parada, etc da gravação aqui! (PD)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendRecordingPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.6,
                  MediaQuery.of(context).size.height * 0.12,
                ),
              ),
              child: Text(
                "Record Now",
                style: Theme.of(context).textTheme.labelLarge,
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
