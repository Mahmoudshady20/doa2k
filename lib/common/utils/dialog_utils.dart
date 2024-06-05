import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  width: 12,
                ),
                Text(message)
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void infoDialog(BuildContext context,
      {required String title,
      required String desc,
      VoidCallback? childAction1,
      VoidCallback? childAction2,
      required String okBtn,
      required String cancelBtn}) {
    AwesomeDialog(
      context: context,

      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      titleTextStyle: const TextStyle(
          color: Colors.black
      ),
      descTextStyle: const TextStyle(
        color: Colors.black
      ),
      dialogBackgroundColor: Colors.white,
      btnCancelColor: Colors.red,
      btnOkColor: Colors.red,
      btnCancelOnPress: () {
        childAction2!.call();
      },
      btnCancelText: cancelBtn,
      btnOkText: okBtn,
      btnOkOnPress: () {
        childAction1!.call();
      },
    ).show();
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String? postActionName,
      VoidCallback? posAction,
      String? actionName,
      VoidCallback? action,
      String? negActionName,
      VoidCallback? negAction,
      bool dismissible = true}) {
    List<Widget> actions = [];
    if (postActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(postActionName)));
    }
    if (actionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            action?.call();
          },
          child: Text(actionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }

    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
              content: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
              actions: actions);
        },
        barrierDismissible: dismissible);
  }
}
