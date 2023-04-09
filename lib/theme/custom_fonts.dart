import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_theme.dart';

// import 'pallete.dart';

class CustomFonts {
  static TextStyle kDisplayLarge = GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );
  static TextStyle kDisplayMedium = GoogleFonts.poppins(
    fontSize: 45,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );
  static TextStyle kDisplaySmall = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );

  static TextStyle kHeadlineLarge = GoogleFonts.montserratAlternates(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );
  static TextStyle kHeadlineMedium = GoogleFonts.montserratAlternates(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );
  static TextStyle kHeadlineSmall = GoogleFonts.montserratAlternates(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );

  static TextStyle kTitleLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: Pallete.mainFontColor,
  );

  static TextStyle kTitleMedium = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Pallete.mainFontColor,
  );
  static TextStyle kTitleSmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: Pallete.mainFontColor,
  );

  static TextStyle kBodyLarge = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    color: Pallete.mainFontColor,
  );

  static TextStyle kBodyMedium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  static TextStyle kBodySmall = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  static TextStyle kLabelLarge = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle kLabelMedium = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static TextStyle kLabelSmall = GoogleFonts.montserrat(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
