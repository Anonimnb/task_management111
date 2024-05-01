import 'package:flutter/material.dart';

class TypeOfTasks {
  String nameOfTask;
  String typeOfWhatDo;
  String time;
  Color colorOfIcon;
  IconData taskIcon;
  String stateOfTask;
  Color colorOfStateOfTask;

  TypeOfTasks({
    required this.nameOfTask,
    required this.typeOfWhatDo,
    required this.time,
    required this.taskIcon,
    required this.colorOfIcon,
    required this.stateOfTask,
    required this.colorOfStateOfTask,
  });

  TypeOfTasks.fromJson(Map<String, dynamic> json)
      : nameOfTask = json["nameOfTask"],
        typeOfWhatDo = json["typeOfWhatDo"],
        time = json["time"],
        colorOfIcon = json["colorOfIcon"],
        taskIcon = json["taskIcon"],
        stateOfTask = json["stateOfTask"],
        colorOfStateOfTask = json["colorOfStateOfTask"];

  Map<String, dynamic> toJson() => {
        "nameOfTask": nameOfTask,
        "typeOfWhatDo": typeOfWhatDo,
        "time": time,
        "colorOfIcon": colorOfIcon,
        "taskIcon": taskIcon,
        "stateOfTask": stateOfTask,
        "colorOfStateOfTask": colorOfStateOfTask,
      };
}

class ListOfTasks {
  static List<TypeOfTasks> list = [
    TypeOfTasks(
        nameOfTask: "Grocery Shopping Tasks",
        typeOfWhatDo: "Market Research",
        time: "10:00 AM",
        taskIcon: Icons.local_post_office_rounded,
        colorOfIcon: const Color(0xfff478b8),
        stateOfTask: "Done",
        colorOfStateOfTask: const Color(0xff8666e9)),
    TypeOfTasks(
      nameOfTask: "Grocery shopping app design",
      typeOfWhatDo: "Competitive Analysis",
      time: '12:00 PM',
      colorOfIcon: const Color(0xfff478b8),
      taskIcon: Icons.local_post_office_rounded,
      stateOfTask: 'In Progress',
      colorOfStateOfTask: const Color(0xffff9674),
    ),
    TypeOfTasks(
      nameOfTask: "Uber Eats redesign challenge",
      typeOfWhatDo: "Create Low-fidelity Wireframe",
      time: '07:00 PM',
      colorOfIcon: const Color(0xff9260f4),
      taskIcon: Icons.account_circle,
      stateOfTask: 'To do',
      colorOfStateOfTask: const Color(0xff359fff),
    ),
    TypeOfTasks(
        nameOfTask: "About design sprint",
        typeOfWhatDo: "How to pitch a Design Sprint",
        time: '09:00 PM',
        colorOfIcon: const Color(0xffff9142),
        taskIcon: Icons.local_post_office_rounded,
        stateOfTask: 'To do',
        colorOfStateOfTask: const Color(0xff359fff)),
  ];
}
