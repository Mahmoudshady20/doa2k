import 'package:doa2k/feature/setting_screen/presentation/widgets/setting_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingView extends StatelessWidget {
  const SettingView({super.key});
  static const String routeName = 'settingsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appbartitle,),
      ),
      body: SettingViewBody(),
    );
  }
}
