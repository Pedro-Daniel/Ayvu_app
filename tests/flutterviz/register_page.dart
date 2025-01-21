import 'package:flutter/material.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: RegisterPage(),
		);
	}
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Implement back navigation logic here
          },
        ),
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "Hello! Register to get started!",
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                context,
                label: "Enter your e-mail",
                hint: "example@example.com",
              ),
              const SizedBox(height: 15),
              _buildTextField(
                context,
                label: "Enter your password",
                hint: "********",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                context,
                label: "Create password",
                hint: "********",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                context,
                label: "Confirm password",
                hint: "********",
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Register logic here
                },
                child: const Text("Register"),
              ),
              const SizedBox(height: 20),
              Text(
                "Or register with",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.alternate_email),
                onPressed: () {
                  // Social registration logic here
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate to login
                },
                child: const Text("Already have an account? Login Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    final theme = Theme.of(context);

    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceVariant,
      ),
    );
  }
}
