import 'package:doa2k/feature/home_screen/presentation/widget/floating_action.dart';
import 'package:doa2k/feature/home_screen/presentation/widget/drug_calender.dart';
import 'package:doa2k/feature/home_screen/presentation/widget/drug_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'drawer_home_screen.dart';


class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  void requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }
  @override
  void initState(){
    requestNotificationPermission();
    super.initState();
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
          DrugCalender(),
          DrugList(),
        ],
      ),
    );
  }
}
