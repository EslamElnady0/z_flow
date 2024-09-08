import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';

import '../../features/reminder/data/model/event_model.dart';
import '../constants/app_texts.dart';

int eventsOffset = 3000000;
int tasksOffset = 1000000;
int habitsOffset = 2000000;
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

  if (eventDate != null && eventDate.isAfter(DateTime.now())) {
    await LocalNotifications.showSchadualedNotification(
        title: event.title,
        body: AppTexts.bigEventAwaitsYou,
        payload: "",
        scheduledDateTime: eventDate,
        id: event.id + eventsOffset);
  } else {
    print('Invalid date format for event: ${event.title}');
  }
}

Future<void> scheduleTaskNotification(TaskModel task) async {
  DateTime? taskDate = parseDateString(task.deadline);

  if (taskDate != null && taskDate.isAfter(DateTime.now())) {
    await LocalNotifications.showSchadualedNotification(
        title: task.title,
        body: AppTexts.yourTaskDeadLineIsComing,
        payload: "",
        scheduledDateTime: taskDate,
        id: task.id + tasksOffset);
  } else {
    print('Invalid date format for task: ${task.title}');
  }
}

Future<void> setDailyHabitsNotification(HabitModel habit) async {
  await LocalNotifications.showPeriodicNotification(
      title: habit.title,
      body: AppTexts.habitsTodo,
      payload: "",
      id: habit.id + habitsOffset);
}
