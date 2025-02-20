import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sound Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  FlutterSoundRecorder recorderModule = FlutterSoundRecorder();
  FlutterSoundPlayer playerModule = FlutterSoundPlayer();

  bool _isRecording = false;
  String _recorderTxt = '00:00:00';
  String _playerTxt = '00:00:00';
  String? _recordingPath;

  StreamSubscription? _recorderSubscription;

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  Future<void> initRecorder() async {
    await recorderModule.openRecorder();
    if (!await Permission.microphone.isGranted) {
      await Permission.microphone.request();
    }
  }

  Future<void> startRecorder() async {
    try {
      String fileName = 'ayvu_recording_${_getCurrentDateTime()}.aac';
      String downloadPath = '/storage/emulated/0/Download/$fileName';

      await recorderModule.startRecorder(
        toFile: downloadPath,
        codec: Codec.aacMP4,
      );

      _recorderSubscription = recorderModule.onProgress!.listen((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds, isUtc: true);
        var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
        setState(() {
          _recorderTxt = txt.substring(0, 8);
        });
      });

      setState(() {
        _isRecording = true;
        _recordingPath = downloadPath;
      });
    } catch (err) {
      print('Error starting recorder: $err');
    }
  }

  Future<void> stopRecorder() async {
    try {
      await recorderModule.stopRecorder();
      _recorderSubscription?.cancel();
      setState(() {
        _isRecording = false;
      });
    } catch (err) {
      print('Error stopping recorder: $err');
    }
  }

  Future<void> startPlayer() async {
    if (_recordingPath == null) return;

    try {
      await playerModule.openPlayer();
      await playerModule.startPlayer(
        fromURI: _recordingPath,
        codec: Codec.aacMP4,
        whenFinished: () {
          setState(() {});
        },
      );

      playerModule.onProgress!.listen((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(e.position.inMilliseconds, isUtc: true);
        var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
        setState(() {
          _playerTxt = txt.substring(0, 8);
        });
      });
    } catch (err) {
      print('Error starting player: $err');
    }
  }

  Future<void> stopPlayer() async {
    try {
      await playerModule.stopPlayer();
      await playerModule.closePlayer();
    } catch (err) {
      print('Error stopping player: $err');
    }
  }

  String _getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyyMMddHHmmss');
    return formatter.format(now);
  }

  @override
  void dispose() {
    recorderModule.closeRecorder();
    playerModule.closePlayer();
    _recorderSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sound Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _recorderTxt,
              style: const TextStyle(fontSize: 35, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                  onPressed: _isRecording ? stopRecorder : startRecorder,
                  iconSize: 48,
                  color: Colors.deepPurple,
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: startPlayer,
                  iconSize: 48,
                  color: Colors.deepPurple,
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: stopPlayer,
                  iconSize: 48,
                  color: Colors.deepPurple,
                ),
                
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _playerTxt,
              style: const TextStyle(fontSize: 35, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}