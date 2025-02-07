import 'dart:async';
import 'package:flutter/material.dart';

// pacotes para implementar a gravação de áudio:
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';




class Recorder extends StatefulWidget {
  const Recorder({super.key});

  @override
  State<Recorder> createState() => _RecorderState();
}




class _RecorderState extends State<Recorder> {
  // atributos de '_RecorderState':
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  int _recordingCount = 0;
  String _statusText  = 'Press to Record';
  double? _dbLevel;



  //
  Future<void> _initializeRecorder() async {
    try {
      await _recorder.openRecorder();
    } catch (e) {
      setState(() {
        _statusText = 'Recording Exception'; //_statusText = 'Recording Erro: $e';
      });
    }
  }

  //
	Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
        _statusText = 'Recording Stoped';
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
      _recordingCount++;
      final String filePath = '/storage/emulated/0/Download/audio_recording_$_recordingCount.aac';

      try {
        await _recorder.startRecorder(
          toFile: filePath,
          codec: Codec.aacADTS,
        );
        setState(() {
          _isRecording = true;
          _statusText = 'Recording...';
        });
      } catch (e) {
        setState(() {
          _recorder.onProgress!.listen( (e) {
            _dbLevel = e.decibels;
            print('valor de "e": $e');
            }); // () {}
          _statusText = 'Error'; //_statusText = 'Erro: $e';
        });
      }
    }
  }

  Future<void> _togglePauseRecording() async {
    return;
  }


  // sobrescreve método 'initState' de 'State':
  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  // sobrescreve método 'dispose' de 'State':
  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  // sobrescreve método 'build' de 'State':
  @override
  Widget build(BuildContext context) {
    return Row(
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
                _isRecording ? LinearProgressIndicator(
                                value: 100.0 / 160.0 * (_dbLevel ?? 1) / 100,
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo),
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                )
                             : Container(),

                Text(
                  _statusText,
                  //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }
}
