import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Tasks {
  @HiveField(0)
  String nameOfTask;
  @HiveField(1)
  String description;
  @HiveField(2)
  String startDate;
  @HiveField(3)
  String endDate;

  Tasks(
      {required this.nameOfTask,
      required this.description,
      required this.startDate,
      required this.endDate});

  Tasks.fromJson(Map<String, dynamic> json)
      : nameOfTask = json["nameOfTask"],
        description = json["description"],
        startDate = json["startDate"],
        endDate = json["endDate"];

  Map<String, dynamic> toJson() => {
        "nameOfTask": nameOfTask,
        "description": description,
        "startDate": startDate,
        "endDate": endDate,
      };
}
