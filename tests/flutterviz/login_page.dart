import 'package:flutter/material.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: LoginPage(),
		);
	}
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {},
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome back! Glad to see you again!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField(
              label: "Enter your e-mail",
              isPassword: false,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Enter your password",
              isPassword: true,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text("Forgot password?"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.6, 48),
              ),
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            const Text("Or login with"),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.alternate_email),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                padding: const EdgeInsets.all(16),
              ),
              child: const Text("Don’t have an account? Register Now"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required bool isPassword}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
      ),
    );
  }
}
