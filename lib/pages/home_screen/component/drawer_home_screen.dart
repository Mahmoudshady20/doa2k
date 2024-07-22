import 'package:doa2k/common/utils/dialog_utils.dart';
import 'package:doa2k/pages/setting_screen/view/setting_screen.dart';
import 'package:doa2k/provider/drug_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrugProvider>(context);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.home_filled,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.home,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingScreen.routeName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.settings,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () async{
              DialogUtils.showLoadingDialog(context, 'Please Wait');
              await provider.deleteAll();
              DialogUtils.hideDialog(context);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.delete_forever_outlined,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'delete all',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
