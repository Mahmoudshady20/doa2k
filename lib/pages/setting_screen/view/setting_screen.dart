import 'package:doa2k/pages/setting_screen/component/font_component.dart';
import 'package:doa2k/pages/setting_screen/component/language_component.dart';
import 'package:doa2k/pages/setting_screen/component/settings_header.dart';
import 'package:doa2k/pages/setting_screen/component/theme_component.dart';
import 'package:doa2k/services/local_db/shared_prefrences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const String routeName = 'settingsScreen';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late String? languageDropValue;
  late String? fontSizeDropValue;
  late String? modeDropValue;
  @override
  void initState() {
    modeDropValue = SharedPrefs.getTheme();
    if (SharedPrefs.getLan() == 'ar') {
      languageDropValue = 'arabic';
    } else {
      languageDropValue = 'english';
    }
    if (SharedPrefs.getTextSize() == 20) {
      fontSizeDropValue = AppLocalizations.of(context)?.small ?? '';
    } else if (SharedPrefs.getTextSize() == 22) {
      fontSizeDropValue = AppLocalizations.of(context)?.medium ?? '';
    } else if (SharedPrefs.getTextSize() == 24) {
      fontSizeDropValue = AppLocalizations.of(context)?.large ?? '';
    } else if (SharedPrefs.getTextSize() == 28) {
      fontSizeDropValue = AppLocalizations.of(context)?.veryLarge ?? '';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appbartitle),
        ),
        body: SettingsHeader(
          children: [
            LanguageComponent(languageDropValue: languageDropValue,onChanged: (value) {
              setState(() {
                languageDropValue = value!;
              });
            },),
            ThemeComponent(
              modeDropValue: modeDropValue,
              onChanged:  (value) {
              setState(() {
                modeDropValue = value;
              });
            },),
            FontSizeComponent(
              fontSizeDropValue: fontSizeDropValue,
              onChanged: (value) {
                setState(() {
                  fontSizeDropValue = value;
                });
              },
            ),
          ],
        ));
  }
}
