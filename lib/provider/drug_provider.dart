import 'package:doa2k/models/drug_model.dart';
import 'package:doa2k/services/notification_local.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DrugProvider extends ChangeNotifier {
  Box<Drug> box = Hive.box<Drug>('models');
  List<Drug>? lists;
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

  updateShowTime(DateTime selected, DateTime focused) {
    selectedDate = selected;
    focusedDate = focused;
    notifyListeners();
  }

  addModel(String drugName, String notes, int numberOfDays, int dateTime,
      int hour, int minutes, int numberOfTimes) async {
    int hours = hour;
    for (int j = 1; j <= numberOfTimes; j++) {
      if (j != 1) {
        hours = hours + (24 ~/ numberOfTimes);
        if (hours >= 24) {
          hours -= 24;
        }
      }
      for (int i = 0; i < numberOfDays; i++) {
        if (i == 0) {
          await box.add(Drug(
              drugName: drugName,
              notes: notes,
              numberOfDays: numberOfDays,
              dateTime: dateTime,
              hour: hours,
              minutes: minutes));
          try{
            LocalNotificationRevision.showDoa2kNotification(
                id: box.values.last.id,
                year: DateTime.fromMillisecondsSinceEpoch(dateTime).year,
                month: DateTime.fromMillisecondsSinceEpoch(dateTime).month,
                day: DateTime.fromMillisecondsSinceEpoch(dateTime).day,
                hour: hours,
                drugName: drugName,
                drugDesc: notes,
                minutes: minutes);
          } catch(e){
          }
        } else {
          await box.add(Drug(
              drugName: drugName,
              notes: notes,
              numberOfDays: numberOfDays,
              dateTime: dateTime + (86400000 * i),
              hour: hours,
              minutes: minutes));
          try{
            LocalNotificationRevision.showDoa2kNotification(
                id: box.values.last.id,
                year: DateTime.fromMillisecondsSinceEpoch(dateTime + (86400000 * i)).year,
                month: DateTime.fromMillisecondsSinceEpoch(dateTime + (86400000 * i)).month,
                day: DateTime.fromMillisecondsSinceEpoch(dateTime + (86400000 * i)).day,
                hour: hours,
                drugName: drugName,
                drugDesc: notes,
                minutes: minutes);
          } catch(e){
          }
        }
      }
    }
    notifyListeners();
  }

  List<Drug> getModels(int datetime) {
    lists = box.values.cast<Drug>().toList();
    return box.values
        .where((element) => element.dateTime == datetime)
        .cast<Drug>()
        .toList()
      ..sort((a, b) => a.hour.compareTo(b.hour));
  }

  deletePotion(int id) async {
    for (int i = lists!.length - 1; i >= 0; i--) {
      if (lists![i].id == id) {
        await box.deleteAt(i);
        LocalNotificationRevision.cancelNotification(id);
      }
    }
    // box.clear();
    notifyListeners();
  }

  deleteMedication(String drugName,String drugDesc) async {
    for (int i = lists!.length - 1; i >= 0; i--) {
      if (lists![i].drugName == drugName && lists![i].notes == drugDesc) {
        await box.deleteAt(i);
        LocalNotificationRevision.cancelNotification(lists![i].id);
      }
    }
    notifyListeners();
  }

  deleteAll() async {
    await box.clear();
    notifyListeners();
  }
}
