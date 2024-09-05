import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/event_model.dart';
import '../../../data/repo/events_repo.dart';

part 'get_events_state.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  GetEventsCubit({required this.eventsRepo}) : super(GetEventsInitial());
  final EventsRepo eventsRepo;
  List<EventModel> events = [];
  List<EventModel> specificDayEventsList = [];

  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Future<void> getEvents(
      {required bool isConnected, required bool isAnonymous}) async {
    emit(GetEventsLoading());
    var result = await eventsRepo.getEvents(
        isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) {
      emit(GetEventsFailure(message: failure.errMessage));
    }, (eventsList) {
      eventsList = eventsList;
      emit(GetEventsSuccess());
    });
  }

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
