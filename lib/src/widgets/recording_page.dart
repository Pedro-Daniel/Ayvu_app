// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// pacotes para implementar a gravação de áudio:
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';

// widgets das páginas
import 'package:ayvu_app/src/widgets/send_recording_page.dart';

// widgets de utilitários:
//import 'package:ayvu_app/src/widgets_recording/recorder.dart';

import 'DB/database_helper.dart';



class RecordingPage extends StatefulWidget {
  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  //FlutterSoundRecorder _recorder = FlutterSoundRecorder();
	FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  bool _isRecording = false;
  String _statusText = 'Press to Record';
  String _filePath = "";

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    try {
      await _recorder.openRecorder();
    } catch (e) {
      setState(() {
        _statusText = 'Recording Erro: $e';
      });
    }
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
        _statusText = 'Stoping Recording';
      });

			Future.delayed(Duration(seconds: 1), () {
      if (!_isRecording) {
				setState(() {
        	_statusText = 'Recording Stoped';
          
      	});
			}	
			});

    } else {
      // Solicitar permissão para o microfone
      PermissionStatus permissionStatus = await Permission.microphone.request();
      if (permissionStatus != PermissionStatus.granted) {
        setState(() {
          _statusText = 'No Permission';
        });
        return;
      }

      // Obter o diretório de documentos do aplicativo
      //final Directory appDocDir = await getApplicationDocumentsDirectory();
      DateTime now = DateTime.now();
      String formatted = DateFormat('yyyy-MM-dd_HH-mm-ss').format(now);
      _filePath = '/storage/emulated/0/Download/audio_recording_$formatted.aac';

      try {
        await _recorder.startRecorder(
          toFile: _filePath,
          codec: Codec.aacADTS,
        );
        setState(() {
          _isRecording = true;
          _statusText = 'Recording...';

        });
      } catch (e) {
        setState(() {
          _statusText = 'Erro: $e';
        });
      }
    }
  }

  Future<void> _saveRecordingToDatabase() async {
    if (_filePath.isEmpty) {
      // Se não houver gravação, não faz nada
      return;
    }

    final dbHelper = DatabaseHelper();

    // Obter o último ID inserido no banco de dados
    final List<Map<String, dynamic>> users = await dbHelper.fetchUsers();
    if (users.isNotEmpty) {
      final int lastUserId = users.last['id'];

      // Atualizar a coluna `recording` com o caminho da gravação
      await dbHelper.updateRecording(lastUserId, _filePath);
    }
  }

	Future<void> _togglePauseRecording() async {
    // ainda não implementada
		return;
  }

  @override
  void dispose() {
    //_recorder.closeRecorder();
    super.dispose();
  } /* */

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
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            //fit: BoxFit.cover,
          ),

          // ElevatedButton(
          //   onPressed: _toggleRecording,
          //   child: Text(_isRecording ? 'Stop Record' : 'Start Record'),
          // ),

          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.1,
          //   width: double.infinity,
          //   //fit: BoxFit.cover,
          // ),

					//Recorder(),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Material(
								//color: Theme.of(context).colorScheme.primary, // Transparente para mostrar apenas o contorno
								shape: RoundedRectangleBorder(
									side: BorderSide(color: Theme.of(context).colorScheme.primary,),
									borderRadius: BorderRadius.circular(5),
								),
								
								child: Padding(
									padding: EdgeInsets.all(8),
									child: Row(
										mainAxisSize: MainAxisSize.min, // Ajusta o tamanho ao conteúdo
										children: [
											IconButton(
												onPressed: _toggleRecording,
												icon: _isRecording ? Icon(Icons.stop_circle_outlined) : Icon(Icons.mic),
											),
											IconButton(
												onPressed: _togglePauseRecording,
												icon: _isRecording ? Icon(Icons.pause) : Icon(Icons.pause, color:Theme.of(context).scaffoldBackgroundColor),
											),
											/* 
											_isRecording ? LinearProgressIndicator(
																			value: 100.0 / 160.0 * (_dbLevel ?? 1) / 100,
																			valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo),
																			backgroundColor: Theme.of(context).colorScheme.primary,
																			)
																	: Container(),
											*/

											Text(
												_statusText,
												//style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
											),
										],
									),
								),
							),
						]
					),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
            width: double.infinity,
            //fit: BoxFit.cover,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Click to start/stop Recording or",
              style: TextStyle(fontSize: 14),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
            width: double.infinity,
            //fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () async {
                await _saveRecordingToDatabase();
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
                "Go to sending Page", //"Record Now",
                //style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
