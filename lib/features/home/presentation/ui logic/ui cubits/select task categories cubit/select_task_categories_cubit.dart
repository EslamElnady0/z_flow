import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_task_categories_state.dart';

class SelectTaskCategoriesCubit extends Cubit<SelectTaskCategoriesState> {
  SelectTaskCategoriesCubit() : super(SelectTaskCategoriesInitial());

  List<String> taskCategories = [];
  void addCategory() {
    emit(SelectTaskCategoriesAdd());
  }

  void selectCategory() {
    if (taskCategories.isNotEmpty) {
      emit(SelectTaskCategoriesSelected());
    } else {
      emit(SelectTaskCategoriesInitial());
    }
  }
}
