import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 2)
class HabitModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String deadline;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  int iteration;
  @HiveField(4)
  bool isFavourited;
  @HiveField(5)
  bool isIterable;
  @HiveField(6)
  bool isDone = false;
  @HiveField(7)
  bool isDoneBefore = false;
  @HiveField(8)
  int id = 0;
  @HiveField(9)
  String doneAt;
  @HiveField(10)
  String note;

  HabitModel(
      {this.iteration = 3,
      this.title = '',
      this.createdAt = '',
      this.deadline = '',
      this.isFavourited = false,
      this.isIterable = true,
      this.isDone = false,
      this.note = '',
      this.isDoneBefore = false,
      this.doneAt = '',
      this.id = 0});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'deadline': deadline,
      'createdAt': createdAt,
      'iteration': iteration,
      'isFavourited': isFavourited,
      'isIterable': isIterable,
      'note': note,
      'isDone': isDone,
      'doneAt': doneAt,
      'isDoneBefore': isDoneBefore,
      'id': id
    };
  }

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      title: json['title'],
      deadline: json['deadline'],
      createdAt: json['createdAt'],
      iteration: json['iteration'],
      note: json['note'],
      isFavourited: json['isFavourited'],
      isIterable: json['isIterable'],
      isDone: json['isDone'],
      isDoneBefore: json['isDoneBefore'],
      doneAt: json['doneAt'],
      id: json['id'],
    );
  }
}
