import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimaryColor = Color(0xFF5D9CEC);
  static const Color lightDividerColor = Color(0xFFFFFFFF);
  static const Color darkPrimaryColor = Color(0xFF5D9CEC);
  static const Color lightHintColor = Color(0xFFDFECDB);
  static const Color darkHintColor = Color(0xFF060E1E);
  static const Color darkDividerColor = Color(0xFF141922);
  static ThemeData lightTheme = ThemeData(
    hintColor: lightHintColor,
    dividerColor: lightDividerColor,
    cardColor: const Color(0xFFDFBD43),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFDFBD43)
    ),
    primaryColor: const Color(0xFF5D9CEC),
    canvasColor: const Color(0xFFFFFDF4),
    scaffoldBackgroundColor: const Color(0xFFFFFDF4),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xFFFFFDF4),
    ),
    iconTheme: const IconThemeData(
        color: Colors.black
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFFFFFDF4)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        side: const BorderSide(color: Colors.black,width: 0.7)
      )
    ),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
          fontSize: 18, color: lightPrimaryColor, fontWeight: FontWeight.bold),
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
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500
      ),
      titleMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    dividerColor: darkDividerColor,
    primaryColor: darkPrimaryColor,
    cardColor: const Color(0xFF6161F3),
    scaffoldBackgroundColor: const Color(0xFF181832),
    hintColor: darkHintColor,
    canvasColor: const Color(0xFF181832),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF6161F3)
    ),
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white
        )
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF181832)
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
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500
      ),
      titleMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
