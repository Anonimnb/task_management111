import 'package:flutter/material.dart';

class InProgressClass {
  IconData taskIcon;
  String typeOfTask;
  String nameOfTask;
  double percentOfTask;
  Color colorOfContainer;
  Color colorOfTaskIcon;

  InProgressClass({
    required this.taskIcon,
    required this.typeOfTask,
    required this.nameOfTask,
    required this.percentOfTask,
    required this.colorOfContainer,
    required this.colorOfTaskIcon,
  });


}

class InProgressList{
  static List<InProgressClass> list = [
    InProgressClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      nameOfTask: "Grocery Shopping app design",
      percentOfTask: 0.7,
      colorOfContainer: Colors.blue.shade400, colorOfTaskIcon: const Color(0xfff478b8),
    ),
    InProgressClass(
      taskIcon: Icons.account_circle,
      typeOfTask: "Personal Project",
      nameOfTask: "Uber Eats redesign challenge",
      percentOfTask: 0.52,
      colorOfContainer: const Color(0xffff7d53), colorOfTaskIcon: const Color(0xff9260f4),
    ),
    InProgressClass(
      taskIcon: Icons.book,
      typeOfTask: "Daily Study",
      nameOfTask: "IT programming UI tasks",
      percentOfTask: 0.87,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: const Color(0xffff9142),
    ),


    InProgressClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      nameOfTask: "Grocery Shopping app design",
      percentOfTask: 0.7,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: const Color(0xfff478b8),
    ),
    InProgressClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      nameOfTask: "Grocery Shopping app design",
      percentOfTask: 0.7,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: const Color(0xffff9142),
    ),
  ];
}


