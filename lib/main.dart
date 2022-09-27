import 'package:flutter/material.dart';
import 'package:flutterkeep/constants.dart';
import 'package:flutterkeep/screens/home_screen.dart';

void main() => runApp(const FlutterKeep());

class FlutterKeep extends StatefulWidget {
  const FlutterKeep({super.key});

  @override
  State<FlutterKeep> createState() => _FlutterKeepState();
}

class _FlutterKeepState extends State<FlutterKeep> {
  bool isDark = false;
  void changeTheme() => setState(() => isDark = !isDark);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: kLightThemeData,
      darkTheme: kDarkThemeData,
      home: Home(
        isDark: isDark,
        changeTheme: changeTheme,
      ),
    );
  }
}
