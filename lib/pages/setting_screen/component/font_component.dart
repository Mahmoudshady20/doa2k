import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../provider/settings_provider.dart';

class FontSizeComponent extends StatelessWidget {
  FontSizeComponent({super.key,required this.fontSizeDropValue});
  String? fontSizeDropValue;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingProvider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.fontSize,
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
                    settingProvider.updateFontSize(20);
                  },
                  value: AppLocalizations.of(context)!.small,
                  child: Text(AppLocalizations.of(context)!.small,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
                DropdownMenuItem(
                  onTap: () {
                    settingProvider.updateFontSize(22);
                  },
                  value: AppLocalizations.of(context)!.medium,
                  child: Text(AppLocalizations.of(context)!.medium,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
                DropdownMenuItem(
                  onTap: () {
                    settingProvider.updateFontSize(24);
                  },
                  value: AppLocalizations.of(context)!.large,
                  child: Text(AppLocalizations.of(context)!.large,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
                DropdownMenuItem(
                  onTap: () {
                    settingProvider.updateFontSize(28);
                  },
                  value: AppLocalizations.of(context)!.veryLarge,
                  child: Text(AppLocalizations.of(context)!.veryLarge,
                      style: const TextStyle(
                        fontSize: 16,
                        // color: Color(0xFF5D9CEC),
                      )),
                ),
              ],
              value: fontSizeDropValue,
              onChanged: (value) {
                setState(() {
                  fontSizeDropValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
