import 'package:doa2k/models/drug_model.dart';
import 'package:doa2k/provider/drug_provider.dart';
import 'package:doa2k/provider/settings_provider.dart';
import 'package:doa2k/utils/date_utils.dart';
import 'package:doa2k/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  final Drug model;
  final int index;
  TaskItem({super.key, required this.model, required this.index});
  late TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    time = TimeOfDay(hour: model.hour, minute: model.minutes);
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .2,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: settingsProvider.myLocal == const Locale('en')? const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ) : const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              onPressed: (buildcontext) {
                deleteDrug(context);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: '',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin : const EdgeInsets.all(1),
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border(
                top: BorderSide(color: Color(0xFFD6D6D6)),
                right: BorderSide(color: Color(0xFFD6D6D6)),
                left: BorderSide(color: Color(0xFFD6D6D6)),
                bottom: BorderSide(color: Color(0xFFD6D6D6)),
              )),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.namemedication} : ${model.drugName}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: compareTime(time, model.dateTime)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: settingsProvider.isDark()
                                ? Colors.white
                                : Colors.black),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.notes} :  ${model.notes}',
                        style: TextStyle(
                            color: settingsProvider.isDark()
                                ? Colors.white
                                : Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                          '${AppLocalizations.of(context)!.numberofdays} : ${model.numberOfDays}',
                          style: TextStyle(
                              color: settingsProvider.isDark()
                                  ? Colors.white
                                  : Colors.black)),
                    ],
                  )),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal:12, vertical: 6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFDFBD43),
                    ),
                    child: compareTime(time, model.dateTime)
                        ?  Text(AppLocalizations.of(context)!.arenottaken)
                        :  Text(AppLocalizations.of(context)!.themedicintaken),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                      model.minutes > 10 ? '${AppLocalizations.of(context)!.timetotakethemedicine} :  ${model.hour}:${model.minutes} ' :'${AppLocalizations.of(context)!.timetotakethemedicine} :  ${model.hour}:0${model.minutes} ',
                      style: TextStyle(
                          color: settingsProvider.isDark()
                              ? Colors.white
                              : Colors.black)),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.watch_later_outlined,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void deleteTask() {
  void deleteDrug(BuildContext context) {
    var provider = Provider.of<DrugProvider>(context, listen: false);
    DialogUtils.infoDialog(context, title: 'Delete', desc: 'هل انت متأكد انك تريد حذف الدواء',okBtn: 'حذف هذه الجرعة',cancelBtn: 'حذف الدواء بالكامل',
        childAction2: () {
      provider.deleteMedication(model.drugName);
    }, childAction1: () {
      provider.deletePotion(model.id);
    });
  }

  bool compareTime(TimeOfDay time, int dateTime) {
    if (dateTime ==
            MyDateUtils.dateOnly(DateTime.now()).millisecondsSinceEpoch &&
        TimeOfDay.now().hour > time.hour) {
      return true;
    } else if (dateTime ==
            MyDateUtils.dateOnly(DateTime.now()).millisecondsSinceEpoch &&
        TimeOfDay.now().hour == time.hour &&
        TimeOfDay.now().minute > time.minute) {
      return true;
    } else if (dateTime <
        MyDateUtils.dateOnly(DateTime.now()).millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }
}
