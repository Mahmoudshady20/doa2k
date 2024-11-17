import 'package:doa2k/feature/setting_screen/presentation/manager/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';

class CustomNumberPicker extends StatelessWidget {
  const CustomNumberPicker({
    super.key,
    required this.value,
    required this.maxValue,
    required this.onChanged,
  });
  final int value;
  final int maxValue;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Row(
      children: [
        const Spacer(),
        NumberPicker(
          value: value,
          minValue: 1,
          maxValue: maxValue,
          itemHeight: AppStyles.getResponsiveFontSize(context, fontSize: 80),
          itemWidth: AppStyles.getResponsiveFontSize(context, fontSize: 126),
          axis: Axis.horizontal,
          onChanged: onChanged,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: settingsProvider.isDark()
                ? Border.all(color: Colors.white)
                : Border.all(color: Colors.black26),
          ),
          selectedTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: settingsProvider.isDark() ? Colors.white : Colors.black,
            fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 40),
          ),
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 20),
              color: settingsProvider.isDark() ? Colors.white : Colors.black),
        ),
        const Spacer(),
      ],
    );
  }
}
