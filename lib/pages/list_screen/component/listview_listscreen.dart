import 'package:doa2k/provider/drug_provider.dart';
import 'package:doa2k/pages/list_screen/component/task_item.dart';
import 'package:doa2k/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewListScreen extends StatelessWidget {
  const ListViewListScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrugProvider>(context);
    return Expanded(
      child: ListView.builder(itemBuilder:(context, index) => TaskItem(model: provider.getModels(MyDateUtils.dateOnly(provider.selectedDate).millisecondsSinceEpoch)[index],index: index,),
        itemCount: provider.getModels(MyDateUtils.dateOnly(provider.selectedDate).millisecondsSinceEpoch).length,
      ),

    );
  }
}
