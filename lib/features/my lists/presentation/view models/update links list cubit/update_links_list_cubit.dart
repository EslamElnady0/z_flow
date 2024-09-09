import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/links list model/links_list_model.dart';
import '../../../data/repo/links_lists_repo.dart';

part 'update_links_list_state.dart';

class UpdateLinksListCubit extends Cubit<UpdateLinksListState> {
  UpdateLinksListCubit({required this.linksListsRepo})
      : super(UpdateLinksListInitial());
  final LinksListsRepo linksListsRepo;

  Future<void> updateLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(UpdateLinksListLoading());
    final result = await linksListsRepo.updateLinksList(
        linksListModel: linksListModel,
        isConnected: isConnected,
        isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(UpdateLinksListFailure(message: failure.errMessage));
    }, (r) {
      emit(UpdateLinksListSuccess());
    });
  }
}
