import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static String getTheme(){
    return prefs.getString('theme') ?? 'light';
  }
  static void setTheme(String theme){
    prefs.setString('theme', theme);
  }
  static String getlan(){
    return prefs.getString('language') ?? 'lan';
  }
  static void setlan(String lan){
    prefs.setString('language', lan);
  }
}