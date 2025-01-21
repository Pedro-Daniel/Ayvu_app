import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';


Future<String> startAudioRecording() async {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();


  PermissionStatus permissionStatus = await Permission.microphone.request();
  if (permissionStatus != PermissionStatus.granted) {
    return 'Permissão para o microfone não concedida!';
  }


  await recorder.startRecorder(
    // Acredito que ao alterar esse diretório para um diretório do projeto as gravações ficam mais acessíveis (PD)
    toFile: '/storage/emulated/0/Download/audio_recording.aac',
    codec: Codec.aacADTS,
  );
  
  return 'Gravando...';
}

Future<void> stopAudioRecording(FlutterSoundRecorder recorder) async {
  await recorder.stopRecorder();
}


class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override

  RecordingPageState createState() => RecordingPageState();
}

class RecordingPageState extends State<RecordingPage> {
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  String _statusText = 'Pressione para gravar';


  Future<void> _toggleRecording() async {
    if (_isRecording) {

      await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
        _statusText = 'Gravação parada';
      });
    } else {

      PermissionStatus permissionStatus = await Permission.microphone.request();
      if (permissionStatus != PermissionStatus.granted) {
        setState(() {
          _statusText = 'Permissão para o microfone não concedida';
        });
        return;
      }


      await _recorder.startRecorder(
        toFile: '/storage/emulated/0/Download/audio_recording.aac',

        codec: Codec.aacADTS,
      );
      setState(() {
        _isRecording = true;
        _statusText = 'Gravando...';
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _recorder = FlutterSoundRecorder();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Página da Gravação',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleRecording,
            child: Text(_isRecording ? 'Parar Gravação' : 'Iniciar Gravação'),
          ),
          SizedBox(height: 20),
          Text(
            _statusText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
