import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/tasks%20cats/data/repos/task_cats_repo.dart';

part 'get_tasks_categories_state.dart';

class GetTasksCategoriesCubit extends Cubit<GetTasksCategoriesState> {
  GetTasksCategoriesCubit({required this.taskCatsRepo})
      : super(GetTasksCategoriesInitial());
  final TaskCatsRepo taskCatsRepo;

  Future<void> getTasksCategories(
      {required bool isConnected, required bool isAnonymous}) async {
    emit(GetTasksCategoriesLoading());
    var result = await taskCatsRepo.getTaskCats(
        isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(GetTasksCategoriesFailure(errMessage: failure.errMessage));
    }, (catsList) {
      emit(GetTasksCategoriesSuccess(cats: catsList));
    });
  }
}
