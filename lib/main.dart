//import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// libs para teste no desktop:
//import 'dart:io';
//import 'package:window_size/window_size.dart';


void main() {
	/* necessário para acessar funcionalidades específicas
	 do Flutter antes de inicializar o app
	 */
	WidgetsFlutterBinding.ensureInitialized();

	/*
	if (Platform.isLinux || Platform.isWindows) {
		setWindowTitle('dimensões proporcionais à do Samsung A54 5G');
		// a resolução do A54 é 2340 x 1080, com uma proporção de 2.166:1 (altura/largura)

		//setWindowMinSize(const Size(300, 650));
		//setWindowMaxSize(const Size(300, 650));

		setWindowFrame(Rect.fromLTWH(0, 0, 300, 650));
	} */
	
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (context) => MyAppState(),
			child: MaterialApp(
				title: 'Ayvu App',
				theme: ThemeData(
					useMaterial3: true,
					colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
				),
				home: MyHomePage(),
			),
		);
	}
}

class MyAppState extends ChangeNotifier {
	// colocar variáveis de estado aqui:
	// ...
}




class MyHomePage extends StatefulWidget {
	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	/*
	The underscore (_) at the start of _MyHomePageState
	makes that class private and is enforced by the compiler.
	*/


	// `NavigationDestination()` lables constant strings:
	static const String homeLabel       = 'home';
	static const String recordingLabel  = 'recording';
	static const String assignmentLabel = 'assignment';


	var currentPageIndex = 0;
	var pageWidgetList = <Widget>[
		BlankPage(),
		RecordingPage(),
		SpeakerProfilePage(),
	];

	@override
	Widget build(BuildContext context) {

		//final ThemeData theme = Theme.of(context);

		return Scaffold(
			bottomNavigationBar: NavigationBar(
				onDestinationSelected: (int index) {
					print(index);

					setState(() {
						currentPageIndex = index;
					});
				},
				//indicatorColor: Colors.amber,
				selectedIndex: currentPageIndex,
				destinations: const <Widget>[
					NavigationDestination(
						selectedIcon: Icon(Icons.home),
						icon: Icon(Icons.home_outlined),
						label: homeLabel,
					),

					NavigationDestination(
						selectedIcon: Icon(Icons.mic_outlined),
						//icon: Badge(child: Icon(Icons.assignment_outlined)),
						icon: Icon(Icons.mic_outlined),
						label: recordingLabel,
					),

					NavigationDestination(
						selectedIcon: Icon(Icons.assignment),
						//icon: Badge(child: Icon(Icons.assignment_outlined)),
						icon: Icon(Icons.assignment_outlined),
						label: assignmentLabel,
					),

				],
			),
			
			body: pageWidgetList[currentPageIndex],

		);
	}
}




class BlankPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		//var appState = context.watch<MyAppState>();

	  return Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Text('BlankPage'),
				],
			),
		);

	}
}




class RecordingPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		//var appState = context.watch<MyAppState>();

		return Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Text('página da gravação'),
				],
			),
		);

	}
}




class SpeakerProfilePage extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		//var appState = context.watch<MyAppState>();
		bool isChecked = false; // _isChecked

		return Form(
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
										'áudio file',
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
										'geolocation',
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

				],
			)
		);

	}
}


/*
DropdownButton<String>(
	items: regionOfOrigin,
	onChanged: print("dale"),
),
*/
