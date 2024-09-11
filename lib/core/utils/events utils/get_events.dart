import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../features/reminder/presentation/view models/get events cubit/get_events_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getEvents(BuildContext context) async {
  await getIt.get<GetEventsCubit>().getEvents(
      context: context,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true);
}
