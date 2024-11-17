import 'package:doa2k/feature/how_to_use/presentation/widget/how_to_use_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HowToUse extends StatelessWidget {
  const HowToUse({super.key});
  static const String routeName = 'howToUseScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appbartitle),
      ),
      body: const HowToUseBody(),
    );
  }
}
