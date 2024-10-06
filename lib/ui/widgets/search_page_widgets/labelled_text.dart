import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget labeledText(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0), // Spacing between labels
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold,
          fontSize: 12),
        ),
        const SizedBox(height: 0.45), // Space between label and text
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16), // Style for the value
        ),
      ],
    ),
  );
}