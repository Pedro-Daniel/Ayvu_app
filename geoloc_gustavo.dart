import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class SpeakerProfilePage extends StatefulWidget {
  @override
  _SpeakerProfilePageState createState() => _SpeakerProfilePageState();
}

class _SpeakerProfilePageState extends State<SpeakerProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _fields = <String, TextEditingController>{
    'Mother tongue': TextEditingController(),
    'Region of origin': TextEditingController(),
    'Name': TextEditingController(),
    'Surname': TextEditingController(),
    'Birth date': TextEditingController(),
  };

  bool get _allFieldsFilled =>
      _fields.values.every((controller) => controller.text.isNotEmpty);

  String _gpsData = '';
  String _errorMessage = '';

  @override
  void dispose() {
    _fields.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _getGpsData() async {
    try {
      PermissionStatus locationPermission = await Permission.location.request();
      PermissionStatus storagePermission = await Permission.storage.request();

      if (locationPermission != PermissionStatus.granted) {
        setState(() {_errorMessage = 'Permissão para localização';}
        );
        return;
      }

      if (storagePermission != PermissionStatus.granted) {
        setState(() {
          _errorMessage = 'Armazenamento negada';
        });
        return;

      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(now);
      String formattedGpsData = '$formattedDate ${position.latitude.toStringAsFixed(2)} ${position.longitude.toStringAsFixed(2)} ${position.altitude.toStringAsFixed(2)}';

      await _saveGpsDataToFile(formattedGpsData);

      setState(() {
        _gpsData = formattedGpsData;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao obter dados de GPS: $e';
      });
    }
  }

  Future<void> _saveGpsDataToFile(String data) async {
    try {
      String dirPath = '/storage/emulated/0/Download';
      int fileIndex = await _getNextFileIndex(dirPath);
      String filePath = '$dirPath/geolocator_$fileIndex.txt';
      final file = File(filePath);
      await file.writeAsString('$data\n', mode: FileMode.append);
      print('GPS Data saved to $filePath');
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao salvar o arquivo: $e';
      });
    }
  }

  Future<int> _getNextFileIndex(String dirPath) async {
    final dir = Directory(dirPath);
    final files = await dir.list().toList();
    final geolocatorFiles = files
        .where((file) => file.path.contains('geolocator_'))
        .toList();

    int maxIndex = 0;
    for (var file in geolocatorFiles) {
      final fileName = file.uri.pathSegments.last;
      final match = RegExp(r'geolocator_(\d+)\.txt').firstMatch(fileName);
      if (match != null) {
        final index = int.parse(match.group(1)!);
        maxIndex = index > maxIndex ? index : maxIndex;
      }
    }

    return maxIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaker Profile Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
              child: Stack(
                children: [
                  Placeholder(),
                  Center(
                    child: Text(
                      'Audio file',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 10.0,
              child: Stack(
                children: [
                  Placeholder(),
                  Center(
                    child: Text(
                      'Geolocation',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Spoken Languages',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            SizedBox(height: 16),
            ..._fields.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: entry.value,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: entry.key,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _allFieldsFilled
                  ? () {
                      // Navega para a próxima tela de gravação (se necessário)
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => RecordingPage(),
                      //   ),
                      // );
                    }
                  : null,
              child: const Text("Go to recording Area"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getGpsData,
              child: const Text("Get GPS Data"),
            ),
            if (_errorMessage.isNotEmpty) 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}