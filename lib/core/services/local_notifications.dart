import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../constants/constants.dart';
//import 'package:rxdart/rxdart.dart';

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //static final onClickNotification = BehaviorSubject<String>();

  // static void onNotificationTapped(NotificationResponse notificationResponse) {
  //   onClickNotification.add(notificationResponse.payload!);
  // }

  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: onNotificationTapped,
      // onDidReceiveBackgroundNotificationResponse: onNotificationTapped
    );
  }

  static Future requestNotificationPermission() async {
    var box = Hive.box(Constants.constantsBox);
    int? declinedCount = box.get("notificationPermissionDenied");

    await Permission.notification.request();
    if (declinedCount != null &&
        declinedCount >= 1 &&
        await Permission.notification.isPermanentlyDenied) {
      openAppSettings();
    }
    if (await Permission.notification.isDenied) {
      box.put("notificationPermissionDenied",
          box.get("notificationPermissionDenied") ?? 0 + 1);
      await Permission.notification.request();
    }
  }

  static Future showSimpleNotification(
      {required String title,
      required String body,
      required String payload,
      required int id}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(id, title, body, notificationDetails, payload: payload);
  }

  static Future showPeriodicNotification(
      {required String title,
      required String body,
      required String payload,
      required int id}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel 2', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.daily, notificationDetails);
  }

  static Future showSchadualedNotification(
      {required String title,
      required String body,
      required String payload,
      int? hours,
      int? mins,
      required DateTime scheduledDateTime,
      required int id}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel 3', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      scheduledDateTime.year,
      scheduledDateTime.month,
      scheduledDateTime.day,
      hours ?? 7, // Set the hour to 7 AM
      mins ?? 0, // Minute
      0, // Second
    );
    if (scheduledDate.isAfter(DateTime.now())) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id, title, body, scheduledDate, notificationDetails,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.dateAndTime,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
    }
  }

  static Future showDailyNotificationAt10AM(
      {required String title,
      required String body,
      required String payload,
      required int id}) async {
    final tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local,
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 10);
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel 4', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, scheduledDate, notificationDetails,
        payload: payload,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  static tz.TZDateTime scheduleDaily() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, now.hour, now.minute + 1);
    // if (scheduledDate.isBefore(now)) {
    //   scheduledDate = scheduledDate.add(const Duration(days: 1));
    // }
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;
  }

  static Future cancelNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
