import 'package:doa2k/local_db/shared_prefrences/shared_prrefrences.dart';
import 'package:doa2k/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
   String? modeDropValue = SharedPrefs.getTheme();
   String? languageDropValue;

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    if(SharedPrefs.getlan() == 'ar'){
      languageDropValue = 'arabic';
    }else {
      languageDropValue = 'english';
    }
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              border: Border.all(color: const Color(0xFFD6D6D6)),
            ),
            child: DropdownButton(
                isExpanded: true,
                dropdownColor: settingProvider.isDark() ? Colors.grey[850] : Colors.white,
                underline: Container(
                  color: Colors.transparent,
                ),
                padding: const EdgeInsets.only(right: 8, left: 8),
                items: [
                   DropdownMenuItem(
                     onTap: () {
                       settingProvider.enableArabic();
                     },
                    value: 'arabic',
                    child:  Text(
                      AppLocalizations.of(context)!.arabic,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    onTap: () {
                      settingProvider.enableEnglish();
                    },
                    value: 'english',
                    child:  Text(AppLocalizations.of(context)!.english,
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ],
                value: languageDropValue,
                onChanged: (value) {
                  setState(() {
                    languageDropValue = value;
                  });
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(AppLocalizations.of(context)!.mode,style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              border: Border.all(color: const Color(0xFFD6D6D6)),
            ),
            child: DropdownButton(
              dropdownColor: settingProvider.isDark() ? Colors.grey[850] : Colors.white,
              isExpanded: true,
              underline: Container(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.only(right: 8, left: 8),
              items: [
                DropdownMenuItem(
                  onTap: (){
                    settingProvider.enableLightMode();
                  },
                  value: 'light',
                  child:  Text(AppLocalizations.of(context)!.light,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
                DropdownMenuItem(
                  onTap: (){
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
        ],
      ),
    );
  }
}
