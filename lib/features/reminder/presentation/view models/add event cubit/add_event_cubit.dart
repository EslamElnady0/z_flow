import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_flow/features/reminder/data/repo/events_repo.dart';

import '../../../data/model/event_model.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit({required this.eventsRepo}) : super(AddEventInitial());
  final EventsRepo eventsRepo;
  Future<void> addEvent(
      {required EventModel event,
      required bool isConnected,
      required bool isAnonymous}) async {
    emit(AddEventLoading());
    var result = await eventsRepo.addEvent(
        event: event, isConnected: isConnected, isAnonymous: isAnonymous);
    result.fold((failure) => emit(AddEventFailure(message: failure.errMessage)),
        (r) => emit(AddEventSuccess()));
  }
}
