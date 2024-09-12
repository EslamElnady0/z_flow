import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/event_model.dart';
import '../../../data/repo/events_repo.dart';

part 'update_event_state.dart';

class UpdateEventCubit extends Cubit<UpdateEventState> {
  UpdateEventCubit({required this.eventsRepo}) : super(UpdateEventInitial());

  final EventsRepo eventsRepo;
  String timeIn24Format = '';
  String startDateWithNoFormating = '';
  String endDateWithNoFormating = '';
  Future<void> updateEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(UpdateEventLoading());
    var result = await eventsRepo.updateEvent(
        event: event, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold(
        (failure) => emit(UpdateEventFailure(message: failure.errMessage)),
        (r) => emit(UpdateEventSuccess()));
  }
}
