import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeakerProfilePageN(),
    );
  }
}

class SpeakerProfilePageN extends StatelessWidget {
  final List<BottomNavigationBarItem> _bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speaker Profile Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems,
        currentIndex: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: (index) {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SectionTitle(title: "Spoken Languages"),
            const CustomDropdown(
              items: ["Option 1"],
              hintText: "Recorded language",
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Didn't find your language?"),
            ),
                        const CustomDropdown(
              items: ["Option 1"],
              hintText: "Speaker's mother tongue",
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: "Conversation background:"),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: "Recording region of origin",
                    hintText: "Enter region",
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_location_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label:
                  "Conversation description: What are the speakers talking about?",
              hintText: "Enter description",
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: "Personal information:"),
            CustomTextField(
              label: "Full Name",
              hintText: "Enter your name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Birth Year",
              hintText: "Enter year",
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: "Gender:"),
            const CustomDropdown(
              items: ["Female", "Male", "N/C"],
              hintText: "Select Gender",
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                const Text("Consent data usage"),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Record now"),
            ),
            const SizedBox(height: 16),
            const Center(child: Text("or")),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Upload recording at my cell phone"),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;

  const CustomTextField({required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String hintText;

  const CustomDropdown({required this.items, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: (value) {},
    );
  }
}
