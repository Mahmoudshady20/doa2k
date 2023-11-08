import 'package:doa2k/provider/drug_provider.dart';
import 'package:doa2k/provider/settings_provider.dart';
import 'package:doa2k/utils/date_utils.dart';
import 'package:doa2k/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController nameController = TextEditingController();

  TextEditingController notesController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  int selectedHour = TimeOfDay.now().hour;
  int selectedMinutes = TimeOfDay.now().minute;
  int numberOfDay = 5;
  int numberOfTimes = 3;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      //Number of times to take it per day
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.8,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Theme.of(context).dividerColor,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Text(AppLocalizations.of(context)!.newmedication,
                style: Theme.of(context).textTheme.titleMedium,
              )),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.namemedication,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                  hint: AppLocalizations.of(context)!.namehint,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.namerror;
                    }
                    return null;
                  }),
              const SizedBox(
                height: 6,
              ),
              Text(AppLocalizations.of(context)!.notes, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                hint: AppLocalizations.of(context)!.noteshint,
                controller: notesController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    notesController.text = AppLocalizations.of(context)!.notesnull;
                  }
                  return null;
                },
                lines: 2,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                AppLocalizations.of(context)!.numberofdays,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 3,
              ),
              NumberPicker(
                value: numberOfDay,
                minValue: 1,
                maxValue: 100,
                step: 1,
                itemHeight: 80,
                // infiniteLoop: true,
                itemWidth: 126,
                axis: Axis.horizontal,
                onChanged: (value) {
                  setState(() => numberOfDay = value);
                },
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: provider.isDark() ?  Border.all(color: Colors.white):  Border.all(color: Colors.black26),
                ),

                selectedTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: provider.isDark() ?  Colors.white : Colors.black,
                    fontSize: 30),
                textStyle:
                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: provider.isDark() ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                AppLocalizations.of(context)!.numberoftimes,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 3,
              ),
              NumberPicker(
                value: numberOfTimes,
                minValue: 1,
                maxValue: 24,
                step: 1,
                itemHeight: 80,
                // infiniteLoop: true,
                itemWidth: 126,
                axis: Axis.horizontal,
                onChanged: (value) {
                  setState(() => numberOfTimes = value);
                },
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: provider.isDark() ?  Border.all(color: Colors.white):  Border.all(color: Colors.black26),
                ),
                selectedTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: provider.isDark() ?  Colors.white : Colors.black,
                    fontSize: 30),
                textStyle:
                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: provider.isDark() ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                AppLocalizations.of(context)!.selecttime,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              InkWell(
                  onTap: () {
                    showTime();
                  },
                  child: Center(
                      child: provider.isEnglish() ? Text(
                    selectedMinutes < 10
                        ? '$selectedHour : 0$selectedMinutes'
                        : '$selectedHour : $selectedMinutes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ) : Text(
                        selectedMinutes < 10
                            ? '0$selectedMinutes : $selectedHour'
                            : '$selectedMinutes : $selectedHour',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.selectdate,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              InkWell(
                  onTap: () {
                    showDate();
                  },
                  child: Center(
                      child: Text(
                    MyDateUtils.formatTaskDate(selectedDate),
                    style: Theme.of(context).textTheme.titleLarge,
                  ))),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    addTaskButton();
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.add))
            ],
          ),
        ),
      ),
    );
  }

  void showDate() async {
    var settingProvider = Provider.of<SettingsProvider>(context,listen: false);
    var date = await showDatePicker(
      locale: settingProvider.myLocal,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 15)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) {
      return;
    }
    selectedDate = date;
    setState(() {});
  }

  void showTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) {
      return;
    }
    selectedHour = time.hour;
    selectedMinutes = time.minute;
    setState(() {});
  }

  void addTaskButton() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var provider = Provider.of<DrugProvider>(context, listen: false);
    provider.addModel(
        nameController.text,
        notesController.text,
        numberOfDay,
        MyDateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
        selectedHour,
        selectedMinutes,
        numberOfTimes,);
  }
}
