// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData? icon;

  const LabelTextField({
    super.key,
    required this.label,
    this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: .bold,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );
  }
}
