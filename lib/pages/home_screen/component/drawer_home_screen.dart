import 'package:doa2k/common/utils/dialog_utils.dart';
import 'package:doa2k/pages/setting_screen/view/setting_screen.dart';
import 'package:doa2k/provider/drug_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


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
          const Spacer(),
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              DialogUtils.infoDialog(
                context,
                title: AppLocalizations.of(context)!.deleteA,
                desc: AppLocalizations.of(context)!.deleteDesc,
                okBtn: 'Yes',
                cancelBtn: 'No',
                childAction2: () {
                  Navigator.pop(context);
                },
                childAction1: (){
                  provider.deleteAll();
                },
              );
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
                  AppLocalizations.of(context)!.deleteA,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            AppLocalizations.of(context)!.contact,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebookF, size: 32),
                onPressed: () async{
                  await _launchUrl(Uri.parse('https://www.facebook.com/mahmoud.shady.7927/'),context);
                },),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram, size: 32),
                onPressed: () async{
                  await _launchUrl(Uri.parse('https://www.instagram.com/sheks_app?igsh=N29kbjF5cjVodWsw&utm_source=qr'),context);
                },),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 32),
                onPressed: () async{
                  await _launchUrl(Uri.parse('https://www.linkedin.com/in/mahmoud-shady-9b8ab0229/'),context);
                },),
            ],
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.01,
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri _url, BuildContext context) async {
    if (await canLaunchUrl(_url)) {
      launchUrl(_url);
    } else {
      DialogUtils.showMessage(
          context, 'I cann\'t go to the specified application, try again');
    }
  }
}
