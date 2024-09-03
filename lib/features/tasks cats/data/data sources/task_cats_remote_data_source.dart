import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';

abstract class TaskCatsRemoteDataSource {
  Future<List<String>> getTaskCats();
  Future<void> addTaskCats(String category);
  Future<void> deleteTaskCategory(String category);
}

class TaskCatsRemoteDataSourceImpl implements TaskCatsRemoteDataSource {
  @override
  Future<List<String>> getTaskCats() async {
    List<String> taskCats = [];
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.categoriesCollection)
        .get()
        .then((value) {
      for (var element in value.docs) {
        taskCats.add(element.id);
      }
    });
    return taskCats;
  }

  @override
  Future<void> addTaskCats(String category) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.categoriesCollection)
        .doc(category)
        .set({"field": "value"});
  }

  @override
  Future<void> deleteTaskCategory(String category) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.categoriesCollection)
        .doc(category)
        .delete();
  }
}
