import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../provider/settings_provider.dart';
import '../../../services/local_db/shared_prefrences/shared_preferences.dart';

class ThemeComponent extends StatelessWidget {
  ThemeComponent({super.key});
  String? modeDropValue = SharedPrefs.getTheme();
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingProvider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.titleMedium),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            border: Border.all(color: const Color(0xFFD6D6D6)),
          ),
          child: StatefulBuilder(
            builder: (context, setState) =>  DropdownButton(
              dropdownColor:
              settingProvider.isDark() ? Colors.grey[850] : Colors.white,
              isExpanded: true,
              underline: Container(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.only(right: 8, left: 8),
              items: [
                DropdownMenuItem(
                  onTap: () {
                    settingProvider.enableLightMode();
                  },
                  value: 'light',
                  child: Text(AppLocalizations.of(context)!.light,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
                DropdownMenuItem(
                  onTap: () {
                    settingProvider.enableDarkMode();
                  },
                  value: 'dark',
                  child: Text(AppLocalizations.of(context)!.dark,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
              ],
              value: modeDropValue,
              onChanged: (value) {
                setState(() {
                  modeDropValue = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        )
      ],
    );
  }
}
