import 'package:doa2k/pages/adddrug_bottomsheet/adddrug_view/addtask_bottomsheet.dart';
import 'package:doa2k/pages/list_screen/view/list_screen.dart';
import 'package:doa2k/pages/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [const ListScreen(), const SettingScreen()];

  int currentIndexx = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appbartitle),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const StadiumBorder(
              side: BorderSide(color:Color(0xFFEDEAEA),width: 4)
          ),
          onPressed: (){
            addTaskBottomSheet();
          },
          backgroundColor: const Color(0xFFDFBD43),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: currentIndexx,
            onTap: (index) {
              setState(() {
                currentIndexx = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_outlined,
                    size: 26,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 26,
                  ),
                  label: '')
            ],
          ),
        ),
      body: tabs[currentIndexx],
    );
  }
  void addTaskBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (context) => const AddTaskBottomSheet(),
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true
    );
  }
}
