import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());
}
