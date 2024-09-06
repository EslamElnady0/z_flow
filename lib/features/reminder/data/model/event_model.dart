import 'package:hive_flutter/hive_flutter.dart';
part 'event_model.g.dart';

@HiveType(typeId: 4)
class EventModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String startDate;

  @HiveField(2)
  String endDate;

  @HiveField(3)
  String note;

  @HiveField(4)
  String createdAt;

  @HiveField(5)
  int id;

  EventModel({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.note,
    required this.createdAt,
    required this.id,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        note: json["note"],
        createdAt: json["createdAt"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "note": note,
        "createdAt": createdAt,
        "id": id,
      };
}
