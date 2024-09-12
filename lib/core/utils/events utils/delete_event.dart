import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/services/local_notifications.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';

import '../../../features/reminder/data/model/event_model.dart';
import '../../../features/reminder/presentation/view models/delete event cubit/delete_event_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_events.dart';

Future<void> deleteEvent(
    {required EventModel event, required BuildContext context}) async {
  await getIt<DeleteEventCubit>().deleteEvent(
    event: event,
    isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
    isAnonymous: getIt<FirebaseAuth>().currentUser!.isAnonymous,
  );
  getIt.get<GetEventsCubit>().events.remove(event);
  getIt.get<GetEventsCubit>().specificDayEventsList.remove(event);
  getIt
      .get<GetEventsCubit>()
      .groupedEvents[
          DateFormat.yMMMd().format(DateTime.parse(event.startDate))]!
      .remove(event);
  LocalNotifications.cancelNotification(id: event.id + eventsOffset);
  if (context.mounted) {
    await getEvents(context);
  }
  getIt
      .get<GetEventsCubit>()
      .getSpecificDayEvents(getIt.get<GetEventsCubit>().focusedDay);
}
