import 'package:flutter/material.dart';

// secondary color
const kSecondaryColor = Color(0xFF0B27B7);
// Light Theme Data
ThemeData kLightThemeData = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: kSecondaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kSecondaryColor,
  ),
);
// Dark Theme Data
ThemeData kDarkThemeData = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: kSecondaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kSecondaryColor,
    foregroundColor: Colors.white,
  ),
);

// Title Text Style
const kTitleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// Below are colors lists for note
List<int> kBackgroundColors = [0xFFF57513, 0xFFADD8E6];
List<int> kTextColors = [0xFF286D8B, 0xFFFAC2A7];
