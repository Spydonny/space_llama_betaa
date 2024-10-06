import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({super.key, required this.controller,
  required this.label, required this.isPassword
  });
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          label: Text(label, style: theme.textTheme.labelSmall,)
        ),
      ),
    );
  }
}
