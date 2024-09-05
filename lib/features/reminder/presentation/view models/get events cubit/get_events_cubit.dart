import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_events_state.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  GetEventsCubit() : super(GetEventsInitial());
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();

  void getSpecificDayEvents(
    DateTime day,
  ) {
    // for (var task in tasks) {
    //   if (task.createdAt == DateFormat.yMMMd().format(day)) {
    //     if (!specificDayTasksList.contains(task)) {
    //       specificDayTasksList.add(task);
    //     }
    //   }
    // }

    // emit(GetTaskSuccess());
  }

  onDaySelected(DateTime day, DateTime focusDay) {
    today = day;
    // focusedDay = focusDay;

    // getSpecificDayEvents(focusDay);
    emit(DaySelectedState());
  }
}
