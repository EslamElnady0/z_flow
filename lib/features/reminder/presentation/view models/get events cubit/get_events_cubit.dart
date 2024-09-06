import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
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
      events = eventsList;
      emit(GetEventsSuccess());
    });
  }

  void getSpecificDayEvents(
    DateTime day,
  ) {
    for (var event in events) {
      if (event.startDate == DateFormat.yMMMd().format(day)) {
        if (!specificDayEventsList.contains(event)) {
          specificDayEventsList.add(event);
        }
      }
    }

    emit(GetEventsSuccess());
  }

  onDaySelected(DateTime day, DateTime focusDay) {
    today = day;
    focusedDay = focusDay;

    specificDayEventsList = [];
    getSpecificDayEvents(focusDay);
    emit(DaySelectedState());
  }
}
