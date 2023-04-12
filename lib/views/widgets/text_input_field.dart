import 'package:flutter/material.dart';
import 'package:tiktok_clone/theme/custom_theme.dart';

import 'package:tiktok_clone/theme/styles.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isObscured = false,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = Pallete.backgroundColor,
    this.primaryColor,
    this.secondaryColor = Pallete.mainFontColor,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isObscured;
  final IconData icon;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Color? primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isObscured,
      decoration: Styles.buildInputDecoration(
        primaryColor: primaryColor == null ? Pallete.mainColor : primaryColor!,
        secondaryColor: secondaryColor,
        backgroundColor: backgroundColor,
        labelText: labelText,
        icon: icon,
      ),
    );
  }
}
