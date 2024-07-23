import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:z_flow/core/core%20cubits/internet%20check%20cubit/internet_check_cubit.dart';
import 'package:z_flow/features/auth/data/repos/auth_repo_impl.dart';
import 'package:z_flow/features/auth/presentation/view%20models/log%20in%20cubit/log_in_cubit.dart';

import '../../features/auth/presentation/view models/sign up cubit/sign_up_cubit.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      firestore: getIt.get<FirebaseFirestore>()));

//////////////////////    cubits     //////////////////////////////
  getIt.registerSingleton<InternetCheckCubit>(InternetCheckCubit());
  getIt.registerLazySingleton<LogInCubit>(
      () => LogInCubit(getIt.get<AuthRepoImpl>()));
  getIt.registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(getIt.get<AuthRepoImpl>()));
}
