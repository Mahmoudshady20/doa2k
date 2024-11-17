import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../manager/settings_provider.dart';

class LanguageComponent extends StatelessWidget {
  const LanguageComponent({
    super.key,
    required this.languageDropValue,
    required this.onChanged,
  });
  final String? languageDropValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            border: Border.all(color: const Color(0xFFD6D6D6)),
          ),
          child: StatefulBuilder(
            builder: (context, setState) => DropdownButton(
              isExpanded: true,
              dropdownColor:
                  settingsProvider.isDark() ? Colors.grey[850] : Colors.white,
              underline: Container(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.only(right: 8, left: 8),
              items: [
                DropdownMenuItem(
                  onTap: () {
                    settingsProvider.enableArabic();
                  },
                  value: 'arabic',
                  child: Text(
                    AppLocalizations.of(context)!.arabic,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  onTap: () {
                    settingsProvider.enableEnglish();
                  },
                  value: 'english',
                  child: Text(AppLocalizations.of(context)!.english,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                ),
              ],
              value: languageDropValue,
              onChanged: onChanged,
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
