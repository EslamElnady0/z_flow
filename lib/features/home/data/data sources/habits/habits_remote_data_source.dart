import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../../models/habit model/habit_model.dart';

abstract class HabitsRemoteDataSource {
  Future<List<HabitModel>> getHabits({required String uid});
  Future<void> addHabit({required HabitModel habit, required String uid});
  Future<void> updateHabit({required HabitModel habit, required String uid});
  Future<void> deleteHabit({required HabitModel habit, required String uid});
}

class HabitsRemoteDataSourceImpl implements HabitsRemoteDataSource {
  @override
  Future<void> addHabit(
      {required HabitModel habit, required String uid}) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.habitsCollection)
        .doc(habit.id.toString())
        .set(habit.toJson());
  }

  @override
  Future<void> deleteHabit(
      {required HabitModel habit, required String uid}) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.habitsCollection)
        .doc(habit.id.toString())
        .delete();
  }

  @override
  Future<List<HabitModel>> getHabits({required String uid}) async {
    var habits = await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.habitsCollection)
        .get()
        .then((value) =>
            value.docs.map((e) => HabitModel.fromJson(e.data())).toList());

    return habits;
  }

  @override
  Future<void> updateHabit(
      {required HabitModel habit, required String uid}) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(uid)
        .collection(Constants.habitsCollection)
        .doc(habit.id.toString())
        .update(habit.toJson());
  }
}
