import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:z_flow/core/errors/failure.dart';
import 'package:z_flow/features/my%20lists/data/data%20sources/links_lists_local_data_source.dart';

import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';

import '../data sources/links_lists_remote_data_source.dart';
import 'links_lists_repo.dart';

class LinksListsRepoImpl implements LinksListsRepo {
  final LinksListsLocalDataSource linksListsLocalDataSource;
  final LinksListsRemoteDataSource linksListsRemoteDataSource;

  LinksListsRepoImpl(
      {required this.linksListsLocalDataSource,
      required this.linksListsRemoteDataSource});

  @override
  Future<Either<Failure, void>> addLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await linksListsRemoteDataSource.addLinksList(linksListModel);
      }
      linksListsLocalDataSource.addLinksList(linksListModel);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await linksListsRemoteDataSource.deleteLinksList(linksListModel);
      }

      linksListsLocalDataSource.deleteLinksList(linksListModel);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, List<LinksListModel>>> getLinksLists(
      {required bool isConnected, required bool isAnonymous}) async {
    try {
      List<LinksListModel> linksListsList =
          linksListsLocalDataSource.getLinksLists();
      if (linksListsList.isNotEmpty) {
        return right(linksListsList);
      } else {
        if (isConnected && !isAnonymous) {
          linksListsList = await linksListsRemoteDataSource.getLinksLists();
          for (var linksList in linksListsList) {
            linksListsLocalDataSource.addLinksList(linksList);
          }
          return right(linksListsList);
        }
        return right(linksListsList);
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous}) async {
    try {
      if (isConnected && !isAnonymous) {
        await linksListsRemoteDataSource.updateLinksList(linksListModel);
      }

      linksListsLocalDataSource.updateLinksList(linksListModel);
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure.fromFirebaseException(exception: e));
      } else {
        log(e.toString());
        return left(
            ServerFailure(errMessage: "Server Error, please try again"));
      }
    }
  }
}
