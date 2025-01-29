import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

import 'package:ayvu_app/src/widgets/databank_page.dart';
import 'speaker_profile_page.dart';

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

	/*
	@override
	void initState() {
		super.initState();
		_createAppFolder();
	} */

	var currentPageIndex = 0;
	var pageWidgetList = <Widget>[
		DatabankPage(),
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
				}, // () => _changeDestination(index),
				
				//indicatorColor: Colors.amber,
				selectedIndex: currentPageIndex,
				destinations: const <Widget>[
					NavigationDestination(
						selectedIcon: Icon(Icons.home),
						icon: Icon(Icons.home_outlined),
						label: 'Databank',
					),

					NavigationDestination(
						selectedIcon: Icon(Icons.add_circle_sharp),
						//icon: Badge(child: Icon(Icons.assignment_outlined)),
						icon: Icon(Icons.add_circle_outline_sharp),
						label: 'Record',
					),

					// NavigationDestination(
					// 	selectedIcon: Icon(Icons.list),
					// 	icon: Icon(Icons.list),
					// 	label: 'My recordings',
					// ),

				],
			),
			
			body: pageWidgetList[currentPageIndex],

		);
	}
}
