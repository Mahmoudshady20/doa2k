import 'package:flutter/material.dart';

import 'add_drug_bottomsheet.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(
          side: BorderSide(color:Colors.white,width: 4)
      ),
      onPressed: (){
        addTaskBottomSheet(context);
      },
      child: const Icon(Icons.add,color: Colors.white,),
    );
  }
  void addTaskBottomSheet(BuildContext context){
    showModalBottomSheet(context: context,
        builder: (context) => const AddDrugBottomSheet(),
        showDragHandle: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        useSafeArea: true
    );
  }
}