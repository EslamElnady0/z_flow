import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/my lists/presentation/view models/get links lists cubit/get_links_lists_cubit.dart';
import '../../DI/service_locator.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';

Future<void> getLinksLists(BuildContext context) async {
  await context.read<GetLinksListsCubit>().getLinksLists(
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true);
}
