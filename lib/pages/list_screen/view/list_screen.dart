import 'package:doa2k/pages/list_screen/component/listscreenheader.dart';
import 'package:doa2k/pages/list_screen/component/listview_listscreen.dart';
import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListScreenHeader(),
        ListViewListScreen(),
      ],
    );
  }
}
