import 'package:doa2k/core/utils/dialog_utils.dart';
import 'package:doa2k/feature/home_screen/presentation/manager/drug_provider.dart';
import 'package:doa2k/feature/home_screen/presentation/widget/bottom_sheet_body.dart';
import 'package:doa2k/feature/home_screen/presentation/widget/custom_number_picker.dart';
import 'package:doa2k/feature/setting_screen/presentation/manager/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../shared/widgets/custom_form_field.dart';

class AddDrugBottomSheet extends StatefulWidget {
  const AddDrugBottomSheet({super.key});

  @override
  State<AddDrugBottomSheet> createState() => _AddDrugBottomSheetState();
}

class _AddDrugBottomSheetState extends State<AddDrugBottomSheet> {
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    notesController = TextEditingController();
    selectedHour = TimeOfDay.now().hour;
    selectedMinutes = TimeOfDay.now().minute;
    numberOfDay = 5;
    numberOfTimes = 3;
    formKey = GlobalKey<FormState>();
    isInterstitialAdLoaded = false;
    selectedDate = DateTime.now();
    adLoaded();
  }

  adLoaded() async {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-7674460303083384/7560105133',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            setState(() {
              _interstitialAd = ad;
              isInterstitialAdLoaded = true;
            });
          },
          onAdFailedToLoad: (error) {
            _interstitialAd.dispose();
          },
        ));
  }

  @override
  void dispose() {
    nameController.dispose();
    notesController.dispose();
    formKey.currentState?.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  late TextEditingController nameController, notesController;
  late GlobalKey<FormState> formKey;
  late DateTime selectedDate;
  late int selectedHour, selectedMinutes, numberOfDay, numberOfTimes;
  late bool isInterstitialAdLoaded;
  late InterstitialAd _interstitialAd;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return BottomSheetBody(
      formKey: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: Text(
            AppLocalizations.of(context)!.newmedication,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(
                    context,
                    fontSize: settingsProvider.fontSize + 3,
                  ),
                ),
          )),
          const SizedBox(
            height: 6,
          ),
          Text(
            AppLocalizations.of(context)!.namemedication,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(
                    context,
                    fontSize: settingsProvider.fontSize,
                  ),
                ),
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
          Text(AppLocalizations.of(context)!.notes,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: AppStyles.getResponsiveFontSize(
                      context,
                      fontSize: settingsProvider.fontSize,
                    ),
                  )),
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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(
                    context,
                    fontSize: settingsProvider.fontSize,
                  ),
                ),
          ),
          const SizedBox(
            height: 3,
          ),
          CustomNumberPicker(
            value: numberOfDay,
            maxValue: 100,
            onChanged: (value) {
              setState(() => numberOfDay = value);
            },
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            AppLocalizations.of(context)!.numberoftimes,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(
                    context,
                    fontSize: settingsProvider.fontSize,
                  ),
                ),
          ),
          const SizedBox(
            height: 3,
          ),
          CustomNumberPicker(
            value: numberOfTimes,
            maxValue: 24,
            onChanged: (value) {
              setState(() => numberOfTimes = value);
            },
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            AppLocalizations.of(context)!.selecttime,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(
                    context,
                    fontSize: settingsProvider.fontSize,
                  ),
                ),
          ),
          InkWell(
              onTap: () {
                showTime();
              },
              child: Center(
                child: settingsProvider.isEnglish()
                    ? Text(
                        selectedMinutes < 10
                            ? '$selectedHour : 0$selectedMinutes'
                            : '$selectedHour : $selectedMinutes',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: AppStyles.getResponsiveFontSize(
                                context,
                                fontSize: settingsProvider.fontSize,
                              ),
                            ),
                      )
                    : Text(
                        selectedMinutes < 10
                            ? '0$selectedMinutes : $selectedHour'
                            : '$selectedMinutes : $selectedHour',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: AppStyles.getResponsiveFontSize(
                                context,
                                fontSize: settingsProvider.fontSize,
                              ),
                            ),
                      ),
              )),
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.selectdate,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppStyles.getResponsiveFontSize(
                    context,
                    fontSize: settingsProvider.fontSize,
                  ),
                ),
          ),
          InkWell(
              onTap: () {
                showDate();
              },
              child: Center(
                  child: Text(
                MyDateUtils.formatTaskDate(selectedDate),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: AppStyles.getResponsiveFontSize(
                        context,
                        fontSize: settingsProvider.fontSize,
                      ),
                    ),
              ))),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                await addTaskButton();
                if (isInterstitialAdLoaded == true) {
                  await _interstitialAd.show();
                }
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: Text(AppLocalizations.of(context)!.add)),
        ],
      ),
    );
  }

  void showDate() async {
    var settingProvider = Provider.of<SettingsProvider>(context, listen: false);
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

  Future<void> addTaskButton() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var provider = Provider.of<DrugProvider>(context, listen: false);
    DialogUtils.showLoadingDialog(
        context, AppLocalizations.of(context)!.please);
    await provider.addModel(
      nameController.text,
      notesController.text,
      numberOfDay,
      MyDateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
      selectedHour,
      selectedMinutes,
      numberOfTimes,
      context,
    );

    if (mounted) {
      DialogUtils.hideDialog(context);
    }
  }
}
