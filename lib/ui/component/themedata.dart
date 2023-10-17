import 'package:flutter/material.dart';

class myThemeData {
  static const Color lightPrimaryColor = Color(0xFF5D9CEC);
  static const Color lightDividerColor = Color(0xFFFFFFFF);
  static const Color darkPrimaryColor = Color(0xFF5D9CEC);
  static const Color lighthintColor = Color(0xFFDFECDB);
  static const Color darkhintColor = Color(0xFF060E1E);
  static const Color darkDividerColor = Color(0xFF141922);
  static ThemeData lightTheme = ThemeData(
      hintColor: lighthintColor,
      dividerColor: lightDividerColor,
      primaryColor: const Color(0xFF5D9CEC),
      scaffoldBackgroundColor: lighthintColor,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
          labelSmall: TextStyle(
              fontSize: 18,
              color: lightPrimaryColor,
              fontWeight: FontWeight.bold),
          labelMedium: TextStyle(
            fontSize: 20,
            color: lightPrimaryColor,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 20,
            color: Color(0xFF5D9CEC),
          ),
          titleMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
      bottomAppBarColor: lightDividerColor);
  static ThemeData darkTheme = ThemeData(
      dividerColor: darkDividerColor,
      primaryColor: darkPrimaryColor,
      scaffoldBackgroundColor: darkhintColor,
      hintColor: darkhintColor,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontSize: 18,
          color: darkPrimaryColor,
        ),
        labelLarge: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 20,
          color: darkPrimaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: Color(0xFF5D9CEC),
        ),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      bottomAppBarColor: darkDividerColor);
}
