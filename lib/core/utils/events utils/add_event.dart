import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';
import 'package:z_flow/core/utils/increament_id_methods.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/add%20event%20cubit/add_event_cubit.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';

import '../../../features/reminder/data/model/event_model.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import '../../services/local_notifications.dart';
import 'get_events.dart';

Future<void> addEvent(
    {required EventModel event, required BuildContext context}) async {
  await getIt<AddEventCubit>().addEvent(
      event: event,
      isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt<FirebaseAuth>().currentUser!.isAnonymous);

  getIt.get<GetEventsCubit>().events.add(event);
  incrementEventsId();

  if (context.mounted) {
    await getEvents(context);
  }
  getIt
      .get<GetEventsCubit>()
      .getSpecificDayEvents(getIt.get<GetEventsCubit>().focusedDay);
  await LocalNotifications.requestNotificationPermission();

  if (context.mounted) {
    scheduleEventNotification(event, context);
  }
}
