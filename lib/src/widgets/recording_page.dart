import 'package:flutter/material.dart';
// pacotes para implementar a gravação de áudio:
//import 'package:permission_handler/permission_handler.dart';
//import 'package:flutter_sound/flutter_sound.dart';

// widgets das páginas
import 'package:ayvu_app/src/widgets/send_recording_page.dart';

// widgets de utilitários:
import 'package:ayvu_app/src/widgets_recording/recorder.dart';




class RecordingPage extends StatefulWidget {
  @override
  State<RecordingPage> createState() => _RecordingPageState();
}


class _RecordingPageState extends State<RecordingPage> {

  /*
	@override
  void initState() {
    super.initState();
    //_initializeRecorder();
  }

	@override
  void dispose() {
    //_recorder.closeRecorder();
    super.dispose();
  }  */

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recording Page'),
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

          SizedBox(
						height: MediaQuery.of(context).size.height * 0.1,
						width: double.infinity,
						//fit: BoxFit.cover,
					),


          Recorder(),


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
							/*
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.6,
                  MediaQuery.of(context).size.height * 0.12,
                ),
              ),
							 */
              child: Text(
                "ir para 'send_recording_page' (mudar)", //"Record Now",
                //style: Theme.of(context).textTheme.labelLarge,
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
