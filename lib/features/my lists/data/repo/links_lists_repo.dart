import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/links list model/links_list_model.dart';

abstract class LinksListsRepo {
  Future<Either<Failure, List<LinksListModel>>> getLinksLists(
      {required bool isConnected, required bool isAnonymous});

  Future<Either<Failure, void>> addLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous});
  Future<Either<Failure, void>> deleteLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous});

  Future<Either<Failure, void>> updateLinksList(
      {required LinksListModel linksListModel,
      required bool isConnected,
      required bool isAnonymous});
}
