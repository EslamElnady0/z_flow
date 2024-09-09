import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/constants.dart';

import '../models/links list model/links_list_model.dart';

abstract class LinksListsRemoteDataSource {
  Future<List<LinksListModel>> getLinksLists();
  Future<void> addLinksList(LinksListModel linksListModel);
  Future<void> deleteLinksList(LinksListModel linksListModel);
  Future<void> updateLinksList(LinksListModel linksListModel);
}

class LinksListsRemoteDataSourceImpl implements LinksListsRemoteDataSource {
  @override
  Future<void> addLinksList(LinksListModel linksListModel) async {
    getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.linksCollection)
        .doc(linksListModel.name)
        .set(linksListModel.toJson());
  }

  @override
  Future<void> deleteLinksList(LinksListModel linksListModel) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.linksCollection)
        .doc(linksListModel.name)
        .delete();
  }

  @override
  Future<List<LinksListModel>> getLinksLists() async {
    List<LinksListModel> linksLists = [];
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.linksCollection)
        .get()
        .then((value) {
      for (var element in value.docs) {
        linksLists.add(LinksListModel.fromJson(element.data()));
      }
    });
    return linksLists;
  }

  @override
  Future<void> updateLinksList(LinksListModel linksListModel) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(Constants.usersCollection)
        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
        .collection(Constants.linksCollection)
        .doc(linksListModel.name)
        .update(linksListModel.toJson());
  }
}
