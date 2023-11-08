import 'package:doa2k/local_db/shared_prefrences/shared_prrefrences.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  Locale myLocal = const Locale('ar');

  void init() {
    if (SharedPrefs.getTheme() == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    if (SharedPrefs.getlan() == 'ar') {
      myLocal = Locale('ar');
    } else {
      myLocal = Locale('en');
    }
  }

  bool isDark() {
    if (themeMode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }

  bool isEnglish() {
    if (myLocal == Locale('en')) {
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
    myLocal = Locale('ar');
    SharedPrefs.setlan('ar');
    notifyListeners();
  }

  void enableEnglish() {
    myLocal = Locale('en');
    SharedPrefs.setlan('en');
    notifyListeners();
  }
}
