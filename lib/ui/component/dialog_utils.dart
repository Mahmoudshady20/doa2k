import 'package:flutter/material.dart';

class DialogUtils{

  static void showLoadingDialog(BuildContext context,
      String message){
    showDialog(context: context,
        builder: (buildContext){
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 12,),
                Text(message)
              ],
            ),
          );
        },barrierDismissible: false
    );
  }
  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }
  static void showMessage(BuildContext context,
      String message, {
        String? postActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool dismissible = true
      }){
    List<Widget> actions = [];
    if(postActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      },
          child: Text(postActionName)));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      },
          child: Text(negActionName)));
    }

    showDialog(context: context,
        builder: (buildContext){
          return AlertDialog(
              content: Text(message,style: TextStyle(
                color: Colors.black
              ),),
              actions: actions
          );
        },
        barrierDismissible: dismissible
    );
  }
}