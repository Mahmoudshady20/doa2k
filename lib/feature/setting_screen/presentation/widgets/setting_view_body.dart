import 'package:doa2k/feature/setting_screen/presentation/widgets/font_component.dart';
import 'package:doa2k/feature/setting_screen/presentation/widgets/language_component.dart';
import 'package:doa2k/feature/setting_screen/presentation/widgets/settings_header.dart';
import 'package:doa2k/feature/setting_screen/presentation/widgets/theme_component.dart';
import 'package:doa2k/core/local_db/shared_pref/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  late String? languageDropValue;
  late String? fontSizeDropValue;
  late String? modeDropValue;

  @override
  Widget build(BuildContext context) {
    getSetting();
    return SettingsHeader(
      children: [
        LanguageComponent(
          languageDropValue: languageDropValue,
          onChanged: (value) {
            setState(
              () {
                languageDropValue = value!;
              },
            );
          },
        ),
        ThemeComponent(
          modeDropValue: modeDropValue,
          onChanged: (value) {
            setState(
              () {
                modeDropValue = value;
              },
            );
          },
        ),
        FontSizeComponent(
          fontSizeDropValue: fontSizeDropValue,
          onChanged: (value) {
            setState(
              () {
                fontSizeDropValue = value;
              },
            );
          },
        ),
      ],
    );
  }

  void getSetting() {
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
  }
}
