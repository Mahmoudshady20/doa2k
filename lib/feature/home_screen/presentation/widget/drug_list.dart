import 'package:doa2k/feature/home_screen/presentation/widget/drug_item.dart';
import 'package:doa2k/feature/home_screen/presentation/manager/drug_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/date_utils.dart';

class DrugList extends StatelessWidget {
  const DrugList({super.key,});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrugProvider>(context);
    return Expanded(
      child: ListView.builder(itemBuilder:(context, index) => DrugItem(model: provider.getModels(MyDateUtils.dateOnly(provider.selectedDate).millisecondsSinceEpoch)[index],index: index,),
        itemCount: provider.getModels(MyDateUtils.dateOnly(provider.selectedDate).millisecondsSinceEpoch).length,
      ),

    );
  }
}
