bloco de código comentado:

```
//import 'dart:io'; // necessário para manipular arquivos e diretórios


/*
// função para a criação do diretório acessado apenas pelo app:
Future<void> _createAppDirectory() async {
	try {
		final directory = await getApplicationDocumentsDirectory(); // chamada para o sistema
		final appFolder = Directory('${directory.path}/Ayvu');
		if (!await appFolder.exists()) { //
			await appFolder.create();
			print('Diretório "Ayvu" criado em: ${appFolder.path}');
			//return appFolder;
		}
	} catch (e) {
		print('Erro ao tentar criar o dir "Ayvu": $e');
	}
} */
```