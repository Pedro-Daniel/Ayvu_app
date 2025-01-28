// import 'package:ayvu_app/src/widgets/recording_page.dart';
import 'package:ayvu_app/src/widgets/recording_page.dart';
import 'package:ayvu_app/src/widgets/upload_page.dart';
import 'package:flutter/material.dart';


class SpeakerProfilePage extends StatefulWidget {
	@override
	_SpeakerProfilePageState createState() => _SpeakerProfilePageState();
}

class _SpeakerProfilePageState extends State<SpeakerProfilePage> {
	final _formKey = GlobalKey<FormState>();
  final String location = "";
  final String birthYear = "";
  final String speakerName = "";
  final String description = "";
	// final _fields = <String, TextEditingController>{
	// 	'Mother tongue': TextEditingController(),
	// 	'Region of origin': TextEditingController(),
	// 	'Name': TextEditingController(),
	// 	'Surname': TextEditingController(),
	// 	'Birth date': TextEditingController(),
	// // }

	// bool get _allFieldsFilled =>
	// 		_fields.values.every((controller) => controller.text.isNotEmpty);

	// @override
	// void dispose() {
	// 	_fields.values.forEach((controller) => controller.dispose());
	// 	super.dispose();
	// }

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
              const CustomDropdown(
                items: ["Português", "Inglês", "Espanhol"],
                hintText: "Recorded language",
                
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Didn't find your language?"),
              ),
                          const CustomDropdown(
                items: ["Português", "Inglês", "Espanhol"],
                hintText: "Speaker's mother tongue",
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: "Conversation background:"),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Recording region of origin",
                      hintText: "Enter region",
                      info: location,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_location_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),



              CustomTextField(
                label: "Conversation description: What are the speakers talking about?",
                hintText: "Enter description",
                info: description,
              ),
              const SizedBox(height: 24),



              const SectionTitle(title: "Personal information:"),
              CustomTextField(
                label: "Full Name",
                hintText: "Enter your name",
                info: speakerName,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Birth Year",
                hintText: "Enter year",
                info: birthYear,
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: "Gender:"),
              const CustomDropdown(
                items: ["Female", "Male", "N/C"],
                hintText: "Select Gender",
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
              const SizedBox(height: 16),
              const Center(child: Text("or")),
              const SizedBox(height: 16),



              ElevatedButton(
                onPressed: () {
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

  const CustomTextField({required this.label, required this.hintText, required this.info});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

  const CustomDropdown({required this.items, required this.hintText});

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
      onChanged: (value) {},
    );
  }
}
