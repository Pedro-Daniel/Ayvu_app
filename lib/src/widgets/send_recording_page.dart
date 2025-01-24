import 'package:flutter/material.dart';

class SendRecordingPage extends StatelessWidget {
  const SendRecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("The whole world is going to hear you!"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Speaker data: Speaker name, age. From place. Speaking language. Speech context: "
                "Blablablablablablablabla blablablablablablablablablablablablablabla.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              _buildConfirmationRow(context, "I confirm that all audio in this recording is sincere and useful data for research purposes. And agree to be punished otherwise."),
              _buildConfirmationRow(context, "I confirm that all above data is true."),
              _buildConfirmationRow(context, "I confirm I am human. (Captcha)"),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Send recording"),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _SwitchTile(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Keep recording file at cell phone?",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmationRow(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _SwitchTile extends StatefulWidget {
  @override
  State<_SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<_SwitchTile> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
    );
  }
}
