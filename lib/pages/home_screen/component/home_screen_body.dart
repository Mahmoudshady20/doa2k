import 'package:doa2k/pages/home_screen/component/listscreenheader.dart';
import 'package:doa2k/pages/home_screen/component/listview_listscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../component/drawer_home_screen.dart';
import '../component/floating_action.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appbartitle),
      ),
      floatingActionButton: const HomeFloatingActionButton(),
      drawer: const DrawerHomeScreen(),
      body: const Column(
        children: [
          ListScreenHeader(),
          ListViewListScreen(),
        ],
      ),
    );
  }
}
