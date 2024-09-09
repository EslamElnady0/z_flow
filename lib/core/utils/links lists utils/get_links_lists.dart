import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/my lists/presentation/view models/get links lists cubit/get_links_lists_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getLinksLists() async {
  await getIt.get<GetLinksListsCubit>().getLinksLists(
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true);
}
