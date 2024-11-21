import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (context) => MyAppState(),
			child: MaterialApp(
				title: 'Namer App',
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
	static const String assignmentLabel = 'assignment';


	var currentPageIndex = 0;
	var pageWidgetList = <Widget>[
		BlankPage(),
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
					Placeholder(),
				],
			),
		);

	}
}




class SpeakerProfilePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		//var appState = context.watch<MyAppState>();


		// `TextFormField()` lables constant strings:
		//const String nameInputLabel      = 'Enter your name:';
		//const String surnameInputLabel   = 'Enter your surname:';
		//const String birthDateInputLabel = 'Enter your birth date:';


		return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('...'),
          ],
        ),
      ),
    );
    /*ListView(
				children: <Widget>[
						Text('Personal informations:'), Divider(),

						Row(
							children: <Widget>[
								TextFormField(
									decoration: const InputDecoration(
										border: UnderlineInputBorder(),
										labelText: nameInputLabel,
									),
								),

								TextFormField(
									decoration: const InputDecoration(
										border: UnderlineInputBorder(),
										labelText: surnameInputLabel,
									),
								),

							],
						),
						
						Text('Language informations:'), Divider(),
				],
			);*/
	}
}

/*
- infos pessoais:
	- nome
	- sobrenome
	- gênero
	- data de nascimento
- informações linguísticas(!?):
	- língua mãe
	- região de origem
	- possui segunda língua? se sim, quais

possíveis ícones:
	- account_box
	- app_registration 
	- article
	- assignment
	- add_circle
	- add_location
	- all_inclusive
*/

/*
DropdownButton<String>(
	items: regionOfOrigin,
	onChanged: print("dale"),
),
*/
