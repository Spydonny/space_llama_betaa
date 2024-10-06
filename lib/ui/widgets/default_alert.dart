import 'package:flutter/material.dart';

class DefaultAlert extends StatelessWidget {
  const DefaultAlert({super.key,
    required this.label, required this.content,
  });
  final String label;
  final String content;

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
          child: const Text('Ок'),
        ),
      ],
    );
  }
}