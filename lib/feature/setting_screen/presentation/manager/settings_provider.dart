import 'package:flutter/material.dart';

import '../../../../core/local_db/shared_pref/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  Locale myLocal = const Locale('ar');
  double fontSize = 20;

  void init() {
    themeMode =
        SharedPrefs.getTheme() == 'dark' ? ThemeMode.dark : ThemeMode.light;
    myLocal =
        SharedPrefs.getLan() == 'ar' ? const Locale('ar') : const Locale('en');
    fontSize = SharedPrefs.getTextSize();
    notifyListeners();
  }

  void updateFontSize(double fontSize) {
    if (fontSize >= 20 && fontSize <= 28) {
      this.fontSize = fontSize;
      SharedPrefs.setTextSize(fontSize);
      notifyListeners();
    } else {
      debugPrint('Font size is out of range');
    }
  }

  bool isDark() => themeMode == ThemeMode.dark;

  bool isEnglish() => myLocal == const Locale('en');

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

  void resetSettings() {
    themeMode = ThemeMode.system;
    myLocal = const Locale('ar');
    fontSize = 20;
    SharedPrefs.setTheme('system');
    SharedPrefs.setLan('ar');
    SharedPrefs.setTextSize(20);
    notifyListeners();
  }
}
