import 'package:flutter/material.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key,required this.formKey,required this.child});
  final GlobalKey<FormState> formKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      //Number of times to take it per day
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Theme.of(context).canvasColor,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
