import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../model/event_model.dart';

abstract class EventsLocalDataSource {
  List<EventModel> getEvents();

  void addEvent(EventModel event);

  void deleteEvent(EventModel event);

  void updateEvent(EventModel event);

  void deleteAllEvents();
}

class EventsLocalDataSourceImpl implements EventsLocalDataSource {
  @override
  List<EventModel> getEvents() {
    var eventsBox = Hive.box<EventModel>(Constants.eventsBox);
    return eventsBox.values.toList();
  }

  @override
  void addEvent(EventModel event) {
    var eventsBox = Hive.box<EventModel>(Constants.eventsBox);
    eventsBox.add(event);
  }

  @override
  void deleteEvent(EventModel event) {
    event.delete();
  }

  @override
  void updateEvent(EventModel event) {
    event.save();
  }

  @override
  void deleteAllEvents() {
    var eventsBox = Hive.box<EventModel>(Constants.eventsBox);
    eventsBox.clear();
  }
}
