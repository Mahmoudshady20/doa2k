import 'package:doa2k/models/drug_model.dart';
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
        if (hours > 24) {
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
        } else {
          await box.add(Drug(
              drugName: drugName,
              notes: notes,
              numberOfDays: numberOfDays,
              dateTime: dateTime + (86400000 * i),
              hour: hours,
              minutes: minutes));
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
        .toList();
  }

  deletePotion(int id) async {
    for (int i = lists!.length - 1; i >= 0; i--) {
      if (lists![i].id == id) {
        await box.deleteAt(i);
      }
    }
    // box.clear();
    notifyListeners();
  }

  deleteMedication(String drugName) async {
    for (int i = lists!.length - 1; i >= 0; i--) {
      if (lists![i].drugName == drugName) {
        await box.deleteAt(i);
      }
    }
    notifyListeners();
  }

  deleteAll() async {
    await box.clear();
    notifyListeners();
  }
}
