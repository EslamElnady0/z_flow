import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../features/reminder/data/model/event_model.dart';
import '../../generated/l10n.dart';

int eventsOffset = 3000000;
int tasksOffset = 1000000;
int habitsOffset = 2000000;
int generateUniqueNotificationId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

DateTime? parseDateString(String dateString) {
  try {
    return DateFormat.yMMMd('en_US').parse(dateString);
  } catch (e) {
    log('Error parsing date: $e');
    return null;
  }
}

Future<void> scheduleEventNotification(
    EventModel event, BuildContext context) async {
  DateTime? eventStartDate = DateTime.parse(event.startDate);

  await LocalNotifications.showSchadualedNotification(
      title: event.title,
      body: S.of(context).bigEventAwaitsYou,
      payload: "",
      context: context,
      hours: event.timeOfEvent.isEmpty
          ? 7
          : int.parse(event.timeOfEvent.split(":")[0]),
      mins: event.timeOfEvent.isEmpty
          ? 0
          : int.parse(event.timeOfEvent.split(":")[1]),
      scheduledDateTime: eventStartDate,
      id: event.id + eventsOffset);
}

Future<void> scheduleTaskNotification(
    TaskModel task, BuildContext context) async {
  DateTime? taskDate = parseDateString(task.deadline);

  if (taskDate != null && taskDate.isAfter(DateTime.now())) {
    await LocalNotifications.showSchadualedNotification(
        title: task.title,
        context: context,
        body: S.of(context).yourTaskDeadLineIsComing,
        payload: "",
        scheduledDateTime: taskDate,
        id: task.id + tasksOffset);
  }
}

Future<void> setDailyHabitsNotification(
    HabitModel habit, BuildContext context) async {
  await LocalNotifications.showPeriodicNotification(
      title: habit.title,
      body: S.of(context).habitsTodo,
      payload: "",
      id: habit.id + habitsOffset);
}
