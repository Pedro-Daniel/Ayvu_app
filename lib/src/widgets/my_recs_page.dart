import 'package:ayvu_app/src/widgets/DB/database_helper.dart';
import 'package:flutter/material.dart';

class MyRecsPage extends StatefulWidget {
  MyRecsPage({super.key});

  @override
  State<MyRecsPage> createState() => _MyRecsPageState();
}

class _MyRecsPageState extends State<MyRecsPage> {
  List<Map<String, dynamic>> recordings = [];

  @override
  void initState() {
    super.initState();
    _loadRecordings();
  }

  void _loadRecordings() async {
    final dbHelper = DatabaseHelper();
    final data = await dbHelper.getAllRecordings();
    setState(() {
      recordings = data;
    });
  }

  void _showRecordingDetails(Map<String, dynamic> recording) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Recording Details"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Name: ${recording['name']}"),
                Text("Mother Language: ${recording['language_mother']}"),
                Text("Recorder Language: ${recording['language_recorder']}"),
                Text("Region: ${recording['region']}"),
                Text("Conversation: ${recording['conversation']}"),
                Text("Gender: ${recording['gender']}"),
                Text("Birth Date: ${recording['birthDate']}"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
            // Barra de pesquisa
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

            // Lista de gravações ou mensagem de vazio
            Expanded(
              child: recordings.isEmpty
                  ? const Center(child: Text("Currently no recordings"))
                  : ListView.builder(
                      itemCount: recordings.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _showRecordingDetails(recordings[index]);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            child: Text(
                                "Recording ${index + 1}: ${recordings[index]['region']}"),
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
