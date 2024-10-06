import 'package:flutter/material.dart';

import '../basic_text_field.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key, required this.controller,
    required this.label, required this.isPassword
  });
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const borderRadius = 5.0;
    return Container(
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: BasicTextField(controller: controller, label: label, isPassword: isPassword,),
    );
  }
}
