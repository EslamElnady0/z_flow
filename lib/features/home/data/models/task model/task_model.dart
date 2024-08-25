import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String notes;
  @HiveField(2)
  final String createdAt;
  @HiveField(3)
  String deadline;
  @HiveField(4)
  List<dynamic> sideTask;
  @HiveField(5)
  bool isFavourited = false;
  @HiveField(6)
  bool isDone = false;
  @HiveField(7)
  bool isDoneBefore = false;
  @HiveField(8)
  final int id;
  @HiveField(9)
  String doneAt;

  TaskModel(
      {required this.sideTask,
      required this.title,
      required this.notes,
      required this.id,
      required this.createdAt,
      this.isDoneBefore = false,
      required this.deadline,
      this.isFavourited = false,
      this.doneAt = "",
      this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'notes': notes,
      'createdAt': createdAt,
      'deadline': deadline,
      'sideTask': sideTask,
      'isFavourited': isFavourited,
      'isDone': isDone,
      'isDoneBefore': isDoneBefore,
      'doneAt': doneAt,
      'id': id
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      notes: json['notes'],
      createdAt: json['createdAt'],
      deadline: json['deadline'],
      sideTask: json['sideTask'],
      isFavourited: json['isFavourited'],
      isDone: json['isDone'],
      isDoneBefore: json['isDoneBefore'],
      doneAt: json['doneAt'],
      id: json['id'],
    );
  }
}
