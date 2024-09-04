import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/task_cats_repo.dart';

part 'delete_task_category_state.dart';

class DeleteTaskCategoryCubit extends Cubit<DeleteTaskCategoryState> {
  DeleteTaskCategoryCubit({required this.taskCatsRepo})
      : super(DeleteTaskCategoryInitial());

  final TaskCatsRepo taskCatsRepo;

  Future<void> deleteTaskCategory(
      {required String category,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(DeleteTaskCategoryLoading());
    var result = await taskCatsRepo.deleteTaskCategory(
        category: category, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(DeleteTaskCategoryFailure(errMessage: failure.errMessage));
    }, (r) {
      emit(DeleteTaskCategorySuccess());
    });
  }
}
