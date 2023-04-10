import 'package:flutter/material.dart';
import 'package:tiktok_clone/theme/custom_fonts.dart';

class Pallete {
  static const Color mainFontColor = Colors.black;
  static const Color backgroundColor = Colors.white;
  static const Color backgroundColorDarker = Color(0xffF2F2F2);
  static const Color borderColor = Colors.grey;
  static const Color mainColor = Colors.pink;
  static final Color mainColorLighter = Colors.pink[100]!;
}

class CustomTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    useMaterial3: true,
  );
}
