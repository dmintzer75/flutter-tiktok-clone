import 'package:flutter/material.dart';
import 'package:tiktok_clone/theme/custom_theme.dart';

import 'custom_fonts.dart';

class Styles {
  static const Radius textFieldRadius = Radius.circular(10);
  static const Radius buttonRadius = Radius.circular(10);
// Text Input Style
  static InputDecoration buildInputDecoration(
      {String labelText = '',
      String hintText = '',
      Color primaryColor = Pallete.mainColor,
      Color secondaryColor = Pallete.mainFontColor,
      Color backgroundColor = Pallete.backgroundColor,
      IconData? icon,
      IconData? suffixIcon,
      Function? suffixIconOnPressed,
      bool withBorder = true}) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Pallete.borderColor,
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: GestureDetector(
          onTap: () {
            if (suffixIconOnPressed != null) {
              suffixIconOnPressed();
            }
          },
          child: Icon(
            suffixIcon,
            color: Pallete.borderColor,
          ),
        ),
      ),
      filled: true,
      fillColor: backgroundColor,
      hintText: hintText,
      hintStyle:
          CustomFonts.kBodyLarge.copyWith(color: Colors.black.withOpacity(.65)),
      labelText: labelText,
      labelStyle:
          CustomFonts.kBodyLarge.copyWith(color: Colors.black.withOpacity(.65)),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: withBorder ? secondaryColor : Colors.transparent,
            width: 1.0),
        borderRadius: const BorderRadius.all(textFieldRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: withBorder ? primaryColor : Colors.transparent, width: 1.0),
        borderRadius: const BorderRadius.all(textFieldRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: withBorder ? Colors.red : Colors.transparent, width: 1.0),
        borderRadius: const BorderRadius.all(textFieldRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: withBorder ? secondaryColor : Colors.transparent,
            width: 1.0),
        borderRadius: const BorderRadius.all(textFieldRadius),
      ),
    );
  }
}
