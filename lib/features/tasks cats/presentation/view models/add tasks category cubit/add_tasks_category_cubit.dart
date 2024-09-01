import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/task_cats_repo.dart';

part 'add_tasks_category_state.dart';

class AddTasksCategoryCubit extends Cubit<AddTasksCategoryState> {
  AddTasksCategoryCubit({required this.taskCatsRepo})
      : super(AddTasksCategoryInitial());

  final TaskCatsRepo taskCatsRepo;

  Future<void> addTaskCategory(
      {required String category,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(AddTasksCategoryLoading());
    var result = await taskCatsRepo.addTaskCats(
        category: category, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(AddTasksCategoryFailure(errMessage: failure.errMessage));
    }, (r) {
      emit(AddTasksCategorySuccess());
    });
  }
}
