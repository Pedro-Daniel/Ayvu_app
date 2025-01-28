import 'package:flutter/material.dart';

class MyRecsPage extends StatelessWidget {
  final List<String> recordings = ["2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05", "2023-01-06", "2023-01-07", "2023-01-08", "2023-01-09", "2023-01-10", "2023-01-04", "2023-01-11", "2023-01-04", "2023-01-01"];

  // HomeScreen({super.key, required this.recordings});
  MyRecsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Recordings",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Text",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Conditional Content
            if (recordings.isEmpty)
              const Text(
                "Currently no recordings",
                style: TextStyle(fontSize: 16),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: recordings.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Lógica para reproduzir ou acessar a gravação
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                        child: Text("Recording ${index + 1}: ${recordings[index]}"),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//Ainda não valida recordings com o mesmo nome!!!





// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: HomeScreen(recordings: ["2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05", "2023-01-06", "2023-01-07", "2023-01-08", "2023-01-09", "2023-01-10", "2023-01-04", "2023-01-11", "2023-01-04", "2023-01-01"]),
//     );
//   }
// }