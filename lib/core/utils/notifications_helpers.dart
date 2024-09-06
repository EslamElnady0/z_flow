import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:z_flow/core/services/local_notifications.dart';

import '../../features/reminder/data/model/event_model.dart';
import '../constants/app_texts.dart';

int generateUniqueNotificationId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

DateTime? parseDateString(String dateString) {
  try {
    return DateFormat.yMMMd().parse(dateString);
  } catch (e) {
    log('Error parsing date: $e');
    return null;
  }
}

Future<void> scheduleEventNotification(EventModel event) async {
  DateTime? eventDate = parseDateString(event.startDate);

  if (eventDate != null) {
    await LocalNotifications.showSchadualedNotification(
        title: event.title,
        body: AppTexts.bigEventAwaitsYou,
        payload: "",
        scheduledDateTime: eventDate,
        id: generateUniqueNotificationId());
  } else {
    print('Invalid date format for event: ${event.title}');
  }
}
