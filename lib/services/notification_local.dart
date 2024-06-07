import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationRevision {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void Function(NotificationResponse)?
      onDidReceiveBackgroundNotificationResponse;
  static void Function(NotificationResponse)? onDidReceiveNotificationResponse;

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  static void showBasicNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'basic notification',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(
        0, 'basic notification', 'body', details,
        payload: "PayLoad Data");
  }

  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'repeated notification',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.periodicallyShow(0,
        'repeated notification', 'body', RepeatInterval.values[DateTime.tuesday], details,
        payload: "PayLoad Data");
  }

  static void showDoa2kNotification(
      {required int year,
      required int id,
        required String drugName,
        required String drugDesc,
      required int month,
      required int day,
      required int hour,
      required int minutes}) async {
    NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails('id 3', 'doa2k notification',
            icon: '@mipmap/ic_launcher',
            sound: RawResourceAndroidNotificationSound('notification.wav'.split('.').first),
            importance: Importance.max, priority: Priority.high));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    await flutterLocalNotificationsPlugin.zonedSchedule(id, drugName, drugDesc,
        tz.TZDateTime(tz.local, year, month, day, hour, minutes), details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
