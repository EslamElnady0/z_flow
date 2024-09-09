import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/my%20lists/data/repo/links_lists_repo.dart';

import '../../../data/models/links list model/links_list_model.dart';

part 'add_links_list_state.dart';

class AddLinksListCubit extends Cubit<AddLinksListState> {
  AddLinksListCubit({required this.linksListsRepo})
      : super(AddLinksListInitial());
  final LinksListsRepo linksListsRepo;

  Future<void> addLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(AddLinksListLoading());
    final result = await linksListsRepo.addLinksList(
        linksListModel: linksListModel,
        isConnected: isConnected,
        isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(AddLinksListFailure(message: failure.errMessage));
    }, (r) {
      emit(AddLinksListSuccess());
    });
  }
}
