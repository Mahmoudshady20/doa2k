import 'package:flutter/material.dart';

import '../../adddrug_bottomsheet/adddrug_view/addtask_bottomsheet.dart';

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
        builder: (context) => const AddTaskBottomSheet(),
        showDragHandle: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        useSafeArea: true
    );
  }
}
