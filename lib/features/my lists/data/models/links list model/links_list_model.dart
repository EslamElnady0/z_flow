import 'package:hive_flutter/hive_flutter.dart';

import '../link item model/link_item.dart';
part 'links_list_model.g.dart';

@HiveType(typeId: 6)
class LinksListModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  List<LinkItem> links;

  LinksListModel({required this.name, required this.links});

  factory LinksListModel.fromJson(Map<String, dynamic> json) => LinksListModel(
        name: json["name"],
        links:
            List<LinkItem>.from(json["links"].map((x) => LinkItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
      };
}
