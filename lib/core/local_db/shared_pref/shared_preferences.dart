import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static String getTheme() {
    return prefs.getString('theme') ?? 'light';
  }

  static void setTheme(String theme) {
    prefs.setString('theme', theme);
  }

  static String getLan() {
    return prefs.getString('language') ?? 'en';
  }

  static void setLan(String lan) {
    prefs.setString('language', lan);
  }

  static double getTextSize() {
    return prefs.getDouble('fontSize') ?? 24;
  }

  static void setTextSize(double size) {
    prefs.setDouble('fontSize', size);
  }
}
