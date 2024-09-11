import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/tasks%20cats/data/repos/task_cats_repo.dart';

import '../../../../../generated/l10n.dart';

part 'get_tasks_categories_state.dart';

class GetTasksCategoriesCubit extends Cubit<GetTasksCategoriesState> {
  GetTasksCategoriesCubit({required this.taskCatsRepo})
      : super(GetTasksCategoriesInitial());
  final TaskCatsRepo taskCatsRepo;
  List<String> cats = [];
  Future<void> getTasksCategories(
      {required bool isConnected,
      required bool isAnonymous,
      required BuildContext context}) async {
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
        List<String> taskCatsList = [
          S.of(context).work,
          S.of(context).personal,
          S.of(context).shopping,
          S.of(context).fitness,
          S.of(context).finance,
          S.of(context).education,
          S.of(context).health,
          S.of(context).travel
        ];
        for (var category in taskCatsList) {
          await taskCatsRepo.addTaskCats(
              category: category,
              isConnected: isConnected,
              isAnonymous: getIt.get<FirebaseAuth>().currentUser!.isAnonymous);
        }
        if (context.mounted) {
          await getTasksCategories(
              isConnected: isConnected,
              isAnonymous: isAnonymous,
              context: context);
        }
      }
    });
  }
}
