import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());
}
