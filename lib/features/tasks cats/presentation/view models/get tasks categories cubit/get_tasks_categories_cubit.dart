import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/tasks%20cats/data/repos/task_cats_repo.dart';

part 'get_tasks_categories_state.dart';

class GetTasksCategoriesCubit extends Cubit<GetTasksCategoriesState> {
  GetTasksCategoriesCubit({required this.taskCatsRepo})
      : super(GetTasksCategoriesInitial());
  final TaskCatsRepo taskCatsRepo;
  List<String> cats = [];
  Future<void> getTasksCategories(
      {required bool isConnected, required bool isAnonymous}) async {
    emit(GetTasksCategoriesLoading());
    var result = await taskCatsRepo.getTaskCats(
        isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(GetTasksCategoriesFailure(errMessage: failure.errMessage));
    }, (catsList) async {
      if (catsList.isNotEmpty) {
        cats = catsList;
        emit(GetTasksCategoriesSuccess());
      } else {
        for (var category in Constants.taskCatsList) {
          await taskCatsRepo.addTaskCats(
              category: category,
              isConnected: isConnected,
              isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous);
        }
        await getTasksCategories(
            isConnected: isConnected, isAnonymous: isAnonymous);
      }
    });
  }
}
