import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/event_model.dart';
import '../../../data/repo/events_repo.dart';

part 'delete_event_state.dart';

class DeleteEventCubit extends Cubit<DeleteEventState> {
  DeleteEventCubit({required this.eventsRepo}) : super(DeleteEventInitial());
  final EventsRepo eventsRepo;
  Future<void> deleteEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(DeleteEventLoading());
    var result = await eventsRepo.deleteEvent(
        event: event, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold(
        (failure) => emit(DeleteEventFailure(message: failure.errMessage)),
        (r) => emit(DeleteEventSuccess()));
  }
}
