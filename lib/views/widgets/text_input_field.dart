import 'package:flutter/material.dart';

import 'package:tiktok_clone/theme/styles.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isObscured = false,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isObscured;
  final IconData icon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isObscured,
      decoration: Styles.buildInputDecoration(
        labelText: labelText,
        icon: icon,
      ),
    );
  }
}
