import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: Colors.black,
  // primaryColorBrightness: Brightness.light,
  primaryColorLight: Colors.blueAccent,
  primaryColorDark: Colors.purple,
  canvasColor: Colors.white70,
  // scaffoldBackgroundColor: Color.fromRGBO(240, 250, 245, 0.6),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: black),
      iconTheme: IconThemeData(color: black, size: 30),
      backgroundColor: white),
  bottomAppBarColor: Colors.white,
  cardColor: const Color.fromRGBO(127, 196, 253, 1),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1aF5E0C3),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: const Color.fromRGBO(255, 149, 0, 1)),
  textTheme: const TextTheme().copyWith(
    headline1: const TextStyle(color: Colors.black),
    headline2: const TextStyle(color: Colors.black),
    headline3: const TextStyle(color: Colors.black),
    headline4: const TextStyle(color: Colors.black),
    headline5: const TextStyle(color: Colors.black),
    headline6: const TextStyle(color: Colors.black),
    subtitle1: const TextStyle(color: Colors.black),
    subtitle2: const TextStyle(color: Colors.black),
    bodyText1: const TextStyle(color: Colors.black),
    bodyText2: const TextStyle(color: Colors.black),
    overline: const TextStyle(color: Colors.black),
    button: const TextStyle(color: Colors.black),
    caption: const TextStyle(color: Colors.black),
  ),
  fontFamily: GoogleFonts.trykker().fontFamily,
  buttonTheme: const ButtonThemeData().copyWith(
    buttonColor: constant,
    textTheme: ButtonTextTheme.primary,
  ),
);

Color constant = Colors.black.withOpacity(0.5);
const Color black = Colors.black;
Color lightgrey = Colors.grey.shade200.withOpacity(0.7);
const Color grey = Colors.grey;
const Color white = Colors.white;
const Color gradientPurple = Color.fromRGBO(83, 57, 214, 1);
const Color gradientPink = Color.fromRGBO(153, 38, 171, 1);
const Color gradientBrightMagenta = Color.fromRGBO(255, 2, 97, 1);
const Color gradientBrightPeach = Color.fromRGBO(254, 175, 143, 1);
const Color gradientViolet = Color.fromRGBO(113, 34, 237, 1);
const Color gradientPurpleLight = Color.fromRGBO(154, 80, 211, 1);

const Color purpleColor = Color.fromRGBO(191, 90, 242, 1);
const Color greenColor = Color.fromRGBO(52, 199, 89, 1);
const Color redColorDark = Color.fromRGBO(176, 0, 32, 1);
const Color redColor = Color.fromRGBO(255, 85, 10, 1);
const Color yellowColor = Color.fromRGBO(255, 245, 0, 1);
const Color iceBlue = Color.fromRGBO(241, 249, 255, 1);
const Color cyanColor = Color.fromRGBO(3, 218, 198, 1);

class _ThemeColor {
  final Color primaryColor;
  final Color primaryColorDark;
  final Color primaryColorLight;
  final Color backgroundColorDark;
  final Color backgroundColorLight;
  final Color textColor;
  final Color accentColor;

  const _ThemeColor({
    required this.primaryColor,
    required this.accentColor,
    required this.backgroundColorDark,
    required this.backgroundColorLight,
    required this.primaryColorDark,
    required this.primaryColorLight,
    required this.textColor,
  });
}
