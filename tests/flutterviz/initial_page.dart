import 'package:flutter/material.dart';

// void main() {
// 	runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
// 	@override
// 	Widget build(BuildContext context) {
// 		return MaterialApp(
// 			home: InitialPage(),
// 		);
// 	}
// }


class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display an image
            Image.network(
              "https://picsum.photos/250?image=9",
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            // Login Button
            CustomButton(
              label: "Login",
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            // Register Button
            CustomButton(
              label: "Register",
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            // Continue as Guest Button
            CustomButton(
              label: "Continue as guest",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Colors.grey, width: 1),
        padding: const EdgeInsets.all(16),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.6,
          MediaQuery.of(context).size.height * 0.1,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
