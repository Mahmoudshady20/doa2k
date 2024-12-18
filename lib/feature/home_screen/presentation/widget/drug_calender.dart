import 'package:doa2k/feature/home_screen/presentation/manager/drug_provider.dart';
import 'package:doa2k/feature/setting_screen/presentation/manager/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DrugCalender extends StatefulWidget {
  const DrugCalender({
    super.key,
  });

  @override
  State<DrugCalender> createState() => _DrugCalenderState();
}

class _DrugCalenderState extends State<DrugCalender> {
  DateTime? selectedDate;

  DateTime? focusedDate;

  CalendarFormat calendarFormat = CalendarFormat.week;
  late bool isInterstitialAdLoaded;
  late InterstitialAd _interstitialAd;
  @override
  void initState() {
    super.initState();
    isInterstitialAdLoaded = false;
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
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrugProvider>(context);
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    focusedDate = provider.focusedDate;
    selectedDate = provider.selectedDate;
    return StatefulBuilder(
      builder: (context, setState) => TableCalendar(
        locale: settingsProvider.myLocal.languageCode,
        focusedDay: focusedDate!,
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        calendarFormat: calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            selectedDate = selectedDay;
            focusedDate = focusedDay;
          });
          provider.updateShowTime(selectedDay, focusedDay);
        },
        onFormatChanged: (format) async {
          setState(() {
            calendarFormat = format;
          });
          if (isInterstitialAdLoaded == true) {
            await _interstitialAd.show();
          }
        },
        daysOfWeekStyle: settingsProvider.isDark()
            ? const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),
              )
            : const DaysOfWeekStyle(),
        headerStyle: settingsProvider.isDark()
            ? HeaderStyle(
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                formatButtonDecoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      left: BorderSide(color: Colors.white),
                      bottom: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(18)),
                leftChevronIcon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            : const HeaderStyle(),
        calendarStyle: CalendarStyle(
          defaultTextStyle: settingsProvider.isDark()
              ? const TextStyle(color: Colors.white)
              : const TextStyle(),
          weekendTextStyle: settingsProvider.isDark()
              ? const TextStyle(color: Colors.white)
              : const TextStyle(),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
          ),
          // weekendDecoration: const BoxDecoration(
          //   color: Color(0xFF4D4117),
          //   shape: BoxShape.circle,
          // ),
          todayTextStyle: settingsProvider.isDark()
              ? const TextStyle(color: Colors.white)
              : const TextStyle(),
          disabledTextStyle: settingsProvider.isDark()
              ? const TextStyle(color: Colors.white)
              : const TextStyle(),

          todayDecoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        pageAnimationEnabled: true,
        formatAnimationDuration: const Duration(milliseconds: 200),
        formatAnimationCurve: Curves.easeInOut,
        pageAnimationDuration: const Duration(milliseconds: 300),
        pageAnimationCurve: Curves.easeInOut,
      ),
    );
  }
}
//Curves.easeInOutBack
