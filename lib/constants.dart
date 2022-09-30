import 'package:flutter/material.dart';

// secondary color
const kSecondaryColor = Color(0xFF0B27B7);
// const kSecondaryColor = Color(0xFFff0000);
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
List<int> kBackgroundColors = [
  0xFF000000,
  0xFFFFFFFF,
  0xFFffe4c4,
  0xFFefdecd,
  0xFFddadaf,
  0xFF98fb98,
  0xFFd8bfd8,
  0xFFdda0dd,
  0xFFcfb53b,
];
List<int> kTextColors = [
  0xFFFFFFFF,
  0xFF000000,
  0xFF286D8B,
  0xFF000000,
  0xFF000000,
  0xFF000000,
  0xFF000000,
  0xFF000000,
  0xFFFFFFFF,
];

// hint/placeholder text style for inputs
const kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 16,
);
// Input title text style
const kInputFieldDecoration = InputDecoration(
  filled: true,
  // icon: Icon(
  //   Icons.title_rounded,
  //   color: Colors.white,
  // ),
  contentPadding: EdgeInsets.all(10),
  hintText: 'Enter Title',
  hintStyle: kHintTextStyle,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide.none,
  ),
);

// Input note text style
const kNoteInputFieldDecoration = InputDecoration(
  filled: true,
  hintText: 'Enter Note',
  hintStyle: kHintTextStyle,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide.none,
  ),
);

// Button height
const kBottomContainerHeight = 50.0;

// Button text Style
const kButtonTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
