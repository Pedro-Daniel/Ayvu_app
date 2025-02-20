import 'package:ayvu_app/src/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class DatabankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Ayvu"),
        actions: [
          // Header com imagem e ícone de menu
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 130,
            child: Placeholder(), // Substituir pela imagem real
          ),
           
          IconButton(
          icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SidePanel(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Título principal
            Text(
              "Global recordings",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Imagem ou gráfico
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Placeholder(), // Substituir pela imagem real
            ),
            const SizedBox(height: 24),
            // Campos de busca
            buildSearchField(
              context: context,
              label: "Search speaker",
              hint: "Enter speaker",
              onTapSearch: () {
                // Handle search action
              },
            ),
            const SizedBox(height: 16),
            buildSearchField(
              context: context,
              label: "Search language",
              hint: "Enter language",
              onTapSearch: () {
                // Handle search action
              },
            ),
            const SizedBox(height: 16),
            buildSearchField(
              context: context,
              label: "Search recording",
              hint: "Enter recording name",
              onTapSearch: () {
                // Handle search action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField({
    required BuildContext context,
    required String label,
    required String hint,
    required VoidCallback onTapSearch,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHigh,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: onTapSearch,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
