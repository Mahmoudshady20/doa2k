import 'package:doa2k/provider/drug_provider.dart';
import 'package:doa2k/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ListScreenHeader extends StatefulWidget {

  const ListScreenHeader({
    super.key,
  });

  @override
  State<ListScreenHeader> createState() => _ListScreenHeaderState();
}

class _ListScreenHeaderState extends State<ListScreenHeader> {

  DateTime? selectedDate;

  DateTime? focusedDate;

  CalendarFormat calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrugProvider>(context);
    var settingProvider = Provider.of<SettingsProvider>(context);
    focusedDate = provider.focusedDate;
    selectedDate = provider.selectedDate;
    return StatefulBuilder(
      builder: (context, setState) => TableCalendar(
        locale: settingProvider.myLocal.languageCode,
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
        onFormatChanged: (format) {
          setState(() {
            calendarFormat = format;
          });
        },
        daysOfWeekStyle: settingProvider.isDark() ? const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Colors.white,
          ),
        ) : const DaysOfWeekStyle(),
        headerStyle: settingProvider.isDark() ?  HeaderStyle(
          titleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          formatButtonTextStyle: const TextStyle(
            color: Colors.white,
          ),
          formatButtonDecoration: BoxDecoration(
            border: const Border(
                top: BorderSide(color: Colors.white,),
                left: BorderSide(color: Colors.white),
                bottom:  BorderSide(color: Colors.white),
                right:  BorderSide(color: Colors.white),
            ),
            borderRadius: BorderRadius.circular(18)
          ),
          leftChevronIcon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          rightChevronIcon: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
        ) : const HeaderStyle(),
        calendarStyle:  CalendarStyle(
          defaultTextStyle: settingProvider.isDark() ?  const TextStyle(color: Colors.white) : const TextStyle(),
          weekendTextStyle: settingProvider.isDark() ?  const TextStyle(color: Colors.white) : const TextStyle(),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
          ),
          // weekendDecoration: const BoxDecoration(
          //   color: Color(0xFF4D4117),
          //   shape: BoxShape.circle,
          // ),
          todayTextStyle: settingProvider.isDark() ?  const TextStyle(color: Colors.white) : const TextStyle(),
          disabledTextStyle: settingProvider.isDark() ?  const TextStyle(color: Colors.white) : const TextStyle(),

          todayDecoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        pageAnimationEnabled : true,
        formatAnimationDuration: const Duration(milliseconds: 200),
        formatAnimationCurve : Curves.easeInOut,
        pageAnimationDuration : const Duration(milliseconds: 300),
        pageAnimationCurve : Curves.easeInOut,
      ),
    );
  }
}
//Curves.easeInOutBack