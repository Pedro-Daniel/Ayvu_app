import 'package:ayvu_app/src/widgets/recording_page.dart';
import 'package:flutter/material.dart';


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

	@override
	void dispose() {
		_fields.values.forEach((controller) => controller.dispose());
		super.dispose();
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
											Navigator.push(
												context,
												MaterialPageRoute(
													builder: (context) => RecordingPage (),
												),
											);
										}
									: null,
							child: const Text("Go to recording Area"),
						),
					],
				),
			),
		);
	}
}
