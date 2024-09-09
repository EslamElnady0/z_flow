import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/constants.dart';
import '../models/links list model/links_list_model.dart';

abstract class LinksListsLocalDataSource {
  List<LinksListModel> getLinksLists();
  void addLinksList(LinksListModel linksListModel);
  void deleteLinksList(LinksListModel linksListModel);
  void updateLinksList(LinksListModel linksListModel);
  void deleteAllLinksLists();
}

class LinksListsLocalDataSourceImpl implements LinksListsLocalDataSource {
  @override
  void addLinksList(LinksListModel linksListModel) {
    var box = Hive.box<LinksListModel>(Constants.linksBox);

    box.add(linksListModel);
  }

  @override
  void deleteAllLinksLists() {
    var box = Hive.box<LinksListModel>(Constants.linksBox);
    box.clear();
  }

  @override
  void deleteLinksList(LinksListModel linksListModel) {
    linksListModel.delete();
  }

  @override
  List<LinksListModel> getLinksLists() {
    var box = Hive.box<LinksListModel>(Constants.linksBox);
    return box.values.toList();
  }

  @override
  void updateLinksList(LinksListModel linksListModel) {
    linksListModel.save();
  }
}
