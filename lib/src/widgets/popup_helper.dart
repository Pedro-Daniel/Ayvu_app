import 'package:flutter/material.dart';

class PopupHelper{
  void buildPopup(BuildContext context, String titulo, String descricao,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(descricao),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// class PopupPage extends StatefulWidget {
// 	@override
// 	_PopupPageState createState() => _PopupPageState();
// }

// class _PopupPageState extends State<PopupPage> {
// 	@override
//   Widget build(BuildContext context,) {
//     _dialogBuilder;
//     return Scaffold(body:Text("HAHAHA"));
// }

//   Future<void> _dialogBuilder(BuildContext context, String titulo, String descricao,) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(titulo),
//           content: Text(descricao),
//           actions: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Fechar'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
