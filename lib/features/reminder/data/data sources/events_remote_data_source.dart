import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../model/event_model.dart';

abstract class EventsRemoteDataSource {
  Future<List<EventModel>> getEvents();

  Future<void> addEvent(EventModel event);

  Future<void> deleteEvent(EventModel event);

  Future<void> updateEvent(EventModel event);
}

class EventsRemoteDataSourceImpl implements EventsRemoteDataSource {
  @override
  Future<void> addEvent(EventModel event) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.eventsCollection)
        .doc("${event.title} ${event.id}")
        .set(event.toJson());
  }

  @override
  Future<void> deleteEvent(EventModel event) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.eventsCollection)
        .doc("${event.title} ${event.id}")
        .delete();
  }

  @override
  Future<List<EventModel>> getEvents() {
    return getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.eventsCollection)
        .get()
        .then((value) {
      return value.docs.map((e) => EventModel.fromJson(e.data())).toList();
    });
  }

  @override
  Future<void> updateEvent(EventModel event) {
    return getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.eventsCollection)
        .doc("${event.title} ${event.id}")
        .update(event.toJson());
  }
}
