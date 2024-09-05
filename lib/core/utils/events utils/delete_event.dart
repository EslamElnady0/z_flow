import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/reminder/data/model/event_model.dart';
import '../../../features/reminder/presentation/view models/delete event cubit/delete_event_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_events.dart';

Future<void> deleteEvent({required EventModel event}) async {
  await getIt<DeleteEventCubit>().deleteEvent(
    event: event,
    isConnected: getIt<InternetCheckCubit>().isDeviceConnected,
    isAnonymous: getIt<FirebaseAuth>().currentUser!.isAnonymous,
  );
  await getEvents();
}
