import 'package:ayvu_app/src/widgets/recording_page.dart';
import 'package:flutter/material.dart';

import 'test_recording_page.dart';

// import 'flutterviz/recording_page.dart';
// import 'test_recording_page.dart';

void main() {
  runApp(MyApp());
}

// Necessário para rodar o teste unitário separadamente
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeakerProfilePage()
    );
  }
}

class SpeakerProfilePage extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		//var appState = context.watch<MyAppState>();
		//bool isChecked = false; // _isChecked

		// Envolvi com um Scaffold pois estava dando problema com o Material (PD)
		return Scaffold(

      appBar: AppBar(
        title: const Text('Speaker Profile Page'),
      ),

			body: Form(
				//key: _formKey,
				child: Column(
					children: <Widget>[
			
						SizedBox(
							height: 100.0,
							child: Stack(
								children: [
									Placeholder(), // para o campo do áudio da gravação
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
						const SizedBox(height: 16), // Divider(),
			
						SizedBox(
							height: 100.0,
							child: Stack(
								children: [
									Placeholder(), // para o campo de geo-localização
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
						const SizedBox(height: 16), // Divider(),
			
						Text(
							'Spoken Languages',
							style: Theme.of(context).textTheme.headlineSmall?.copyWith(
								fontWeight: FontWeight.bold,
								color: Theme.of(context).colorScheme.primary,
							),
						),
						const SizedBox(height: 16), // Divider(),
			
						TextFormField(
							decoration: const InputDecoration(
								border: UnderlineInputBorder(),
								labelText: 'Mother tongue:',
							),
						),
						TextFormField(
							decoration: const InputDecoration(
								border: UnderlineInputBorder(),
								labelText: 'Region of origin:',
							),
						),
			
						/*
						FormField<bool>(
							initialValue: isChecked,
			
							validator: (value) {
								if (value != true) {
									return 'You must accept the terms and conditions';
								}
								return null;
							},
							
							builder: (state) {
								return Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									
									children: [
										Row(
											children: [
												Checkbox(
													value: state.value,
													onChanged: (value) {
														state.didChange(value);
													},
												),
												const Text('speak more than one language?'),
											],
										),
			
										if (state.hasError)
											Text(
												state.errorText!,
												style: TextStyle(
													color: Theme.of(context).colorScheme.error,
													fontSize: 12,
												),
											),
									],
								);
							},
						),
							*/
			
						Text(
							'Personal information',
							style: Theme.of(context).textTheme.headlineSmall?.copyWith(
								fontWeight: FontWeight.bold,
								color: Theme.of(context).colorScheme.primary,
							),
						),
						const SizedBox(height: 16), // Divider(),
			
						TextFormField(
							decoration: const InputDecoration(
								border: UnderlineInputBorder(),
								labelText: 'Enter your name:',
							),
						),
			
						TextFormField(
							decoration: const InputDecoration(
								border: UnderlineInputBorder(),
								labelText: 'Enter your surname:',
							),
						),
			
						TextFormField(
							decoration: const InputDecoration(
								border: UnderlineInputBorder(),
								labelText: 'Enter your birth date:',
                
							),
						),

            ElevatedButton(
              child: Text("Go to recording Area"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecordingPageTST(),));
              },
            ),
					],
				),
			),
		);
	}
}




/*
DropdownButton<String>(
	items: regionOfOrigin,
	onChanged: print("dale"),
), */
