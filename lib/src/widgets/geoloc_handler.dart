import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class GPSHandler extends StatefulWidget {
  @override
  _GPSHandlerState createState() => _GPSHandlerState();
}

class _GPSHandlerState extends State<GPSHandler> {
  String _gpsData = '';
  String _errorMessage = '';


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
    return Scaffold(); //insert content?
  }
}