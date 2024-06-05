import 'package:flutter/material.dart';
import '../services/local_db/shared_prefrences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  Locale myLocal = const Locale('ar');
  double fontSize = 20;
  void init() {
    if (SharedPrefs.getTheme() == 'dark') {
      themeMode = ThemeMode.dark;
    } else if (SharedPrefs.getTheme() == 'light'){
      themeMode = ThemeMode.light;
    }
    if (SharedPrefs.getLan() == 'ar') {
      myLocal = const Locale('ar');
    } else if(SharedPrefs.getLan() == 'en'){
      myLocal = const Locale('en');
    }
    if (SharedPrefs.getTextSize() == 20) {
      fontSize = 20;
    } else if(SharedPrefs.getTextSize() == 22) {
      fontSize = 22;
    } else if(SharedPrefs.getTextSize() == 24) {
      fontSize = 24;
    } else if(SharedPrefs.getTextSize() == 28) {
      fontSize = 28;
    }
  }
  void updateFontSize(double fontSize){
    this.fontSize = fontSize;
    SharedPrefs.setTextSize(fontSize);
    notifyListeners();
  }
  bool isDark() {
    if (themeMode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }

  bool isEnglish() {
    if (myLocal == const Locale('en')) {
      return true;
    } else {
      return false;
    }
  }

  void enableLightMode() {
    themeMode = ThemeMode.light;
    SharedPrefs.setTheme("light");
    notifyListeners();
  }

  void enableDarkMode() {
    themeMode = ThemeMode.dark;
    SharedPrefs.setTheme("dark");
    notifyListeners();
  }

  void enableArabic() {
    myLocal = const Locale('ar');
    SharedPrefs.setLan('ar');
    notifyListeners();
  }

  void enableEnglish() {
    myLocal = const Locale('en');
    SharedPrefs.setLan('en');
    notifyListeners();
  }
}
