import 'package:hive_flutter/hive_flutter.dart';
part 'goal_model.g.dart';

@HiveType(typeId: 3)
class GoalModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String id;
  @HiveField(2)
  final String createdAt;

  GoalModel({
    required this.title,
    required this.id,
    required this.createdAt,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      title: json['title'] as String,
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'createdAt': createdAt,
    };
  }
}
