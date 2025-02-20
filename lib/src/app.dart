import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:path_provider/path_provider.dart';

import 'widgets/app_state.dart';


class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (context) => MyAppState(),
			child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
