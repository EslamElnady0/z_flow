import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/DI/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/links list model/links_list_model.dart';
import '../../../data/repo/links_lists_repo.dart';

part 'get_links_lists_state.dart';

class GetLinksListsCubit extends Cubit<GetLinksListsState> {
  GetLinksListsCubit({required this.linksListsRepo})
      : super(GetLinksListsInitial());
  final LinksListsRepo linksListsRepo;

  List<LinksListModel> linksLists = [];
  Future<void> getLinksLists(
      {required bool isConnected,
      required bool isAnonymous,
      required BuildContext context}) async {
    emit(GetLinksListsLoading());
    final result = await linksListsRepo.getLinksLists(
        isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(GetLinksListsFailure(message: failure.errMessage));
    }, (linksListsList) async {
      if (linksListsList.isNotEmpty) {
        linksLists = linksListsList;
        emit(GetLinksListsSuccess());
      } else {
        List<LinksListModel> linksLists = [
          LinksListModel(name: S.of(context).personalDevelopment, links: []),
          LinksListModel(name: S.of(context).educationAndCourses, links: []),
          LinksListModel(name: S.of(context).productivityTools, links: []),
          LinksListModel(name: S.of(context).readLater, links: []),
        ];
        for (var linksList in linksLists) {
          await linksListsRepo.addLinksList(
              linksListModel: linksList,
              isConnected: isConnected,
              isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous);
        }
        if (context.mounted) {
          await getLinksLists(
              isConnected: isConnected,
              isAnonymous: isAnonymous,
              context: context);
        }
      }
    });
  }
}
