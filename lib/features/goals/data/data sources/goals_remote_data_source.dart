import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../model/goal_model.dart';

abstract class GoalsRemoteDataSource {
  Future<List<GoalModel>> getGoals();
  Future<void> addGoal(GoalModel goal);
  Future<void> deleteGoal(GoalModel goal);
  Future<void> updateGoal(GoalModel goal);
}

class GoalsRemoteDataSourceImpl implements GoalsRemoteDataSource {
  @override
  Future<void> addGoal(GoalModel goal) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.goalsCollection)
        .doc("${goal.title} ${goal.id}")
        .set(goal.toJson());
  }

  @override
  Future<void> deleteGoal(GoalModel goal) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.goalsCollection)
        .doc("${goal.title} ${goal.id}")
        .delete();
  }

  @override
  Future<List<GoalModel>> getGoals() async {
    return getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.goalsCollection)
        .get()
        .then((value) =>
            value.docs.map((e) => GoalModel.fromJson(e.data())).toList());
  }

  @override
  Future<void> updateGoal(GoalModel goal) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.goalsCollection)
        .doc("${goal.title} ${goal.id}")
        .update(goal.toJson());
  }
}
