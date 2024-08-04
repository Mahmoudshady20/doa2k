import 'package:doa2k/common/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key,required this.text,required this.index});
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text('${index +1}- $text',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: AppStyles.getResponsiveFontSize(context, fontSize: provider.fontSize,),
        ),
      ),
    );
  }
}
