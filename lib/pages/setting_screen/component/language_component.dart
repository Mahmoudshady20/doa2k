import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../provider/settings_provider.dart';

typedef MyChange = String? Function(String?)?;
class LanguageComponent extends StatelessWidget {
  const LanguageComponent({super.key, required this.languageDropValue,required this.myChange});
  final String languageDropValue;
  final MyChange myChange;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingProvider = Provider.of<SettingsProvider>(context);
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
          child: DropdownButton(
                isExpanded: true,
                dropdownColor:
                    settingProvider.isDark() ? Colors.grey[850] : Colors.white,
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
                    child: Text(
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
                    child: Text(AppLocalizations.of(context)!.english,
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ],
                value: languageDropValue,
                onChanged:myChange,
            ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        )
      ],
    );
  }
}
