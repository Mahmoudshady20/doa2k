import 'package:doa2k/pages/home_screen/component/listscreenheader.dart';
import 'package:doa2k/pages/home_screen/component/listview_listscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../component/drawer_home_screen.dart';
import '../component/floating_action.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  AppOpenAd? _appOpenAd;
  @override
  void initState() {
    super.initState();
    adLoaded();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _appOpenAd?.dispose();
  }

  adLoaded() async {
    AppOpenAd.load(
        adUnitId: 'ca-app-pub-7674460303083384/4713599882',
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            _appOpenAd = ad;
            _appOpenAd!.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint('error $error');
          },
        ),
    );
  }

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
