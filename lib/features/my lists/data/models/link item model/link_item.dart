import 'package:hive_flutter/hive_flutter.dart';

part 'link_item.g.dart';

@HiveType(typeId: 5)
class LinkItem extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String description;

  LinkItem({required this.name, required this.url, required this.description});

  factory LinkItem.fromJson(Map<String, dynamic> json) {
    return LinkItem(
      name: json['name'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'description': description,
    };
  }
}
