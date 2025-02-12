import 'package:ayvu_app/src/widgets/send_recording_page.dart';
import 'package:flutter/material.dart';

// pacotes para implementar a gravação de áudio:
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'DB/database_helper.dart';

class RecordingPage extends StatefulWidget {
  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  String _statusText = 'Press to Record';
  int _recordingCount = 0;
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
    } else {
      // Solicitar permissão para o microfone
      PermissionStatus permissionStatus = await Permission.microphone.request();
      if (permissionStatus != PermissionStatus.granted) {
        setState(() {
          _statusText = 'No Permission';
        });
        return;
      }

      _recordingCount++;

      // Obter o diretório de documentos do aplicativo
      //final Directory appDocDir = await getApplicationDocumentsDirectory();
      _filePath =
          '/storage/emulated/0/Download/audio_recording_$_recordingCount.aac';

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

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            //fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: _toggleRecording,
            child: Text(_isRecording ? 'Stop Record' : 'Start Record'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            //fit: BoxFit.cover,
          ),
          Text(
            _statusText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
