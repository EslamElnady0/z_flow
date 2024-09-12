import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z_flow/core/utils/notifications_helpers.dart';

import '../../../features/reminder/data/model/event_model.dart';
import '../../../features/reminder/presentation/view models/get events cubit/get_events_cubit.dart';
import '../../../features/reminder/presentation/view models/update event cubit/update_event_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_events.dart';

Future<void> updateEvent(
    {required EventModel event, required BuildContext context}) async {
  await getIt<UpdateEventCubit>().updateEvent(
    event: event,
    isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
    isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
  );

  if (context.mounted) {
    scheduleEventNotification(event, context);
    await getEvents(context);
  }
  getIt
      .get<GetEventsCubit>()
      .getSpecificDayEvents(getIt.get<GetEventsCubit>().focusedDay);
}
