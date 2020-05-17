import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customMaterialTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Color(0xffEAEBF1),
    backgroundColor: Color(0xffB4B4B4),
    primaryColor: Color(0xff0E1F9A),
    accentColor: Color(0xffFC942E),
    brightness: Brightness.light,
    cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xffEAEBF1),
      elevation: 16,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 12,
      margin: EdgeInsets.all(8),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.ubuntu(
          fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.ubuntu(
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.ubuntu(
          fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.ubuntu(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.ubuntu(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.ubuntu(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.rubik(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.rubik(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.rubik(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.rubik(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.rubik(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ));
