import 'package:doa2k/core/utils/app_styles.dart';
import 'package:doa2k/feature/home_screen/domain/entity/drug_entity.dart';
import 'package:doa2k/feature/home_screen/presentation/manager/drug_provider.dart';
import 'package:doa2k/feature/setting_screen/presentation/manager/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/dialog_utils.dart';

class DrugItem extends StatefulWidget {
  final Drug model;
  final int index;
  const DrugItem({super.key, required this.model, required this.index});

  @override
  State<DrugItem> createState() => _DrugItemState();
}

class _DrugItemState extends State<DrugItem> {
  late TimeOfDay time;
  late bool isInterstitialAdLoaded;
  late InterstitialAd _interstitialAd;
  @override
  void initState() {
    time = TimeOfDay(hour: widget.model.hour, minute: widget.model.minutes);
    isInterstitialAdLoaded = false;
    adLoaded();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .15,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: settingsProvider.myLocal == const Locale('en')
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
              onPressed: (buildcontext) async {
                deleteDrug();
                if (isInterstitialAdLoaded == true) {
                  await _interstitialAd.show();
                }
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
          margin: const EdgeInsets.all(1),
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
                        '${AppLocalizations.of(context)!.namemedication} : ${widget.model.drugName}',
                        style: TextStyle(
                            fontSize: AppStyles.getResponsiveFontSize(context,
                                fontSize: settingsProvider.fontSize.toDouble()),
                            fontWeight: FontWeight.bold,
                            decorationThickness: 2,
                            decoration: compareTime(time, widget.model.dateTime)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: settingsProvider.isDark()
                                ? Colors.white
                                : Colors.black),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.notes} :  ${widget.model.notes}',
                        style: TextStyle(
                            fontSize: AppStyles.getResponsiveFontSize(context,
                                fontSize: settingsProvider.fontSize - 3),
                            color: settingsProvider.isDark()
                                ? Colors.white
                                : Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          '${AppLocalizations.of(context)!.numberofdays} : ${widget.model.numberOfDays}',
                          style: TextStyle(
                              fontSize: AppStyles.getResponsiveFontSize(context,
                                  fontSize: settingsProvider.fontSize - 5),
                              color: settingsProvider.isDark()
                                  ? Colors.white
                                  : Colors.black)),
                    ],
                  )),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFDFBD43),
                    ),
                    child: compareTime(time, widget.model.dateTime)
                        ? Text(
                            AppLocalizations.of(context)!.arenottaken,
                          )
                        : Text(AppLocalizations.of(context)!.themedicintaken),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                      widget.model.minutes >= 10
                          ? '${AppLocalizations.of(context)!.timetotakethemedicine} :  ${widget.model.hour > 12 ? widget.model.hour - 12 : widget.model.hour}:${widget.model.minutes} ${widget.model.timeCol}'
                          : '${AppLocalizations.of(context)!.timetotakethemedicine} :  ${widget.model.hour > 12 ? widget.model.hour - 12 : widget.model.hour}:0${widget.model.minutes} ${widget.model.timeCol}',
                      style: TextStyle(
                          fontSize: AppStyles.getResponsiveFontSize(context,
                              fontSize: settingsProvider.fontSize - 3),
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

  void deleteDrug() {
    var provider = Provider.of<DrugProvider>(context, listen: false);

    DialogUtils.infoDialog(
      context,
      title: AppLocalizations.of(context)!.delete,
      desc: AppLocalizations.of(context)!.deleteDesc,
      okBtn: AppLocalizations.of(context)!.deletePotion,
      cancelBtn: AppLocalizations.of(context)!.deleteAll,
      childAction2: () {
        provider.deleteMedication(widget.model.drugName, widget.model.notes);
      },
      childAction1: () {
        provider.deletePotion(widget.model.id);
      },
    );
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
