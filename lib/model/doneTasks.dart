import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class DoneTasks {
  @HiveField(0)
  String startDate;


  DoneTasks(
      {required this.startDate,});

  DoneTasks.fromJson(Map<String, dynamic> json)
      : startDate = json["startDate"];

  Map<String, dynamic> toJson() => {
    "startDate": startDate,
  };
}
