import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardClass {
  IconData taskIcon;
  String typeOfTask;
  String nameOfTask;
  double percentOfTask;
  Color colorOfContainer;
  Color colorOfTaskIcon;

  CardClass({
    required this.taskIcon,
    required this.typeOfTask,
    required this.nameOfTask,
    required this.percentOfTask,
    required this.colorOfContainer,
    required this.colorOfTaskIcon,
  });


}

class TaskCardList{
  static List<CardClass> cardClass = [
    CardClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      nameOfTask: "Grocery Shopping app design",
      percentOfTask: 0.7,
      colorOfContainer: Colors.blue.shade400, colorOfTaskIcon: Color(0xfff478b8),
    ),
    CardClass(
      taskIcon: Icons.account_circle,
      typeOfTask: "Personal Project",
      nameOfTask: "Uber Eats redesign challenge",
      percentOfTask: 0.52,
      colorOfContainer: const Color(0xffff7d53), colorOfTaskIcon: Color(0xff9260f4),
    ),
    CardClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Daily Study",
      nameOfTask: "IT programming UI tasks",
      percentOfTask: 0.87,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: Color(0xffff9142),
    ),


    CardClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      nameOfTask: "Grocery Shopping app design",
      percentOfTask: 0.7,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: Color(0xfff478b8),
    ),
    CardClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      nameOfTask: "Grocery Shopping app design",
      percentOfTask: 0.7,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: Color(0xffff9142),
    ),
  ];
}


