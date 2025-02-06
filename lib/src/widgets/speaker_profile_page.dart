import 'dart:io';
import 'package:ayvu_app/src/widgets/popup_helper.dart';
import 'package:ayvu_app/src/widgets/recording_page.dart';
import 'package:ayvu_app/src/widgets/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'DB/database_helper.dart';

class SpeakerProfilePage extends StatefulWidget {
  @override
  _SpeakerProfilePageState createState() => _SpeakerProfilePageState();
}

class _SpeakerProfilePageState extends State<SpeakerProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _controllerSpokenLanguage; // Controlador para o dropdown de idioma
  String? _controllerMotherTongue; // Controlador para língua materna
  String? _controllerGender; // Controlador para gênero
  final _conversationController = TextEditingController();
  final _regionController = TextEditingController();
  final _birthDateController = TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper();

  String location = "";
  String birthYear = "";
  String speakerName = "";
  String description = "";

  String _gpsData = '';
  String _errorMessage = '';

  Future<void> _saveData() async {
    print("Apos aqui estará os campos");
    print({
      'name': _nameController.text,
      'region': _regionController.text,
      'conversation': _conversationController.text,
      'birthDate': _birthDateController.text,
      'language_mother': _controllerMotherTongue,
      'language_recorder': _controllerSpokenLanguage,
      'gender': _controllerGender,
    });
    await _dbHelper.insertUser({
      'name': _nameController.text,
      'language_mother': _controllerMotherTongue,
      'language_recorder': _controllerSpokenLanguage,
      'region': _regionController.text,
      'conversation': _conversationController.text,
      'gender': _controllerGender,
      'birthDate': _birthDateController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados salvos com sucesso!')),
    );
  }

  Future<void> _clearDatabase() async {
    await _dbHelper.clearDatabase();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Banco de dados limpo com sucesso!')),
    );
  }

  Future<void> _getGpsData() async {
    try {
      PermissionStatus locationPermission = await Permission.location.request();
      PermissionStatus storagePermission = await Permission.storage.request();

      if (locationPermission != PermissionStatus.granted) {
        setState(() {
          _errorMessage = 'Permissão para localização negada.';
        });
        return;
      }

      if (storagePermission != PermissionStatus.granted) {
        setState(() {
          _errorMessage = 'Permissão para armazenamento negada.';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(now);
      String formattedGpsData =
          '$formattedDate ${position.latitude.toStringAsFixed(2)} ${position.longitude.toStringAsFixed(2)} ${position.altitude.toStringAsFixed(2)}';

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
    final geolocatorFiles =
        files.where((file) => file.path.contains('geolocator_')).toList();

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
        title: const Text("Speaker Profile Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SectionTitle(title: "Spoken Languages"),
              CustomDropdown(
                items: const ["Português", "Inglês", "Espanhol"],
                hintText: "Recorded language",
                onChanged: (value) {
                  setState(() {
                    _controllerSpokenLanguage = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Didn't find your language?"),
              ),
              CustomDropdown(
                items: const ["Português", "Inglês", "Espanhol"],
                hintText: "Speaker's mother tongue",
                onChanged: (value) {
                  setState(() {
                    _controllerMotherTongue = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: "Conversation background:"),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controllerform: _regionController,
                      label: "Recording region of origin",
                      hintText: "Enter region",
                      info: location,
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.add_location_rounded),
                      onPressed: () {
                        if (_errorMessage != "" || _errorMessage.isNotEmpty) {
                          PopupHelper()
                              .buildPopup(context, "Ops...", _errorMessage);
                        }
                        _getGpsData();
                        print(_gpsData == "");
                        print(_gpsData);
                      }),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controllerform: _conversationController,
                label:
                    "Conversation description: What are the speakers talking about?",
                hintText: "Enter description",
                info: description,
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: "Personal information:"),
              CustomTextField(
                controllerform: _nameController,
                label: "Full Name",
                hintText: "Enter your name",
                info: speakerName,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controllerform: _birthDateController,
                label: "Birth Year",
                hintText: "Enter year",
                info: birthYear,
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: "Gender:"),
              CustomDropdown(
                items: const ["Female", "Male", "N/C"],
                hintText: "Select Gender",
                onChanged: (value) {
                  setState(() {
                    _controllerGender = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text("Consent data usage"),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecordingPage(),
                    ),
                  );
                },
                child: const Text("Record now"),
              ),
              ElevatedButton(
                onPressed: _clearDatabase,
                child: Text('Limpar banco de dados'),
              ),
              const SizedBox(height: 16),
              const Center(child: Text("or")),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await _saveData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadPage(),
                    ),
                  );
                },
                child: const Text("Upload recording at my cell phone"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String info;
  final TextEditingController controllerform;

  const CustomTextField(
      {required this.label,
      required this.hintText,
      required this.info,
      required this.controllerform});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerform,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter some text!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final Function(String?)? onChanged;

  const CustomDropdown(
      {required this.items, required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
