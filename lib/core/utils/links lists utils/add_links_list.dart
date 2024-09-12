import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/add%20links%20list%20cubit/add_links_list_cubit.dart';

import '../../../features/my lists/data/models/links list model/links_list_model.dart';
import '../../core cubits/internet check cubit/internet_check_cubit.dart';
import 'get_links_lists.dart';

Future<void> addLinksList(
    {required LinksListModel linksList, required BuildContext context}) async {
  await context.read<AddLinksListCubit>().addLinksList(
        linksListModel: linksList,
        isConnected: getIt.get<InternetCheckCubit>().isDeviceConnected,
        isAnonymous: getIt.get<FirebaseAuth>().currentUser?.isAnonymous ?? true,
      );
  if (context.mounted) {
    await getLinksLists(context);
  }
}
