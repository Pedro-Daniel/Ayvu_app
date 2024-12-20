//import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';


void main() { // async
	/* necessário para acessar funcionalidades específicas
	 do Flutter antes de inicializar o app
	 */
	//WidgetsFlutterBinding.ensureInitialized();

	// cria diretório acessado apenas pelo app:
	//await _createAppDirectory();
	
	runApp(MyApp());
}
