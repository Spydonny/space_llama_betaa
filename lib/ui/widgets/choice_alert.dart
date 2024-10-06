import 'package:flutter/material.dart';

class ChoiceAlert extends StatelessWidget {
  const ChoiceAlert({super.key,
    required this.label, required this.content,
    required this.onPressed
  });
  final String label;
  final String content;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Text(label,
        style: theme.textTheme.bodyLarge,
      ),
      content: Text(
        content,
        style: theme.textTheme.bodyMedium,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Нет'),
        ),
        TextButton(
          onPressed: () async {
            await onPressed();
            Navigator.pop(context);
          },
          child: const Text('Да'),
        ),
      ],
    );
  }
}