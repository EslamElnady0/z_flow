import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import '../../../features/my lists/data/models/links list model/links_list_model.dart';
import '../../../features/my lists/presentation/view models/update links list cubit/update_links_list_cubit.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_links_lists.dart';

Future<void> updateLinksList(
    {required LinksListModel linksList, required BuildContext context}) async {
  await context.read<UpdateLinksListCubit>().updateLinksList(
      linksListModel: linksList,
      isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
      isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous);
  if (context.mounted) {
    await getLinksLists();
  }
}
