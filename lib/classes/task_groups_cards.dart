import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardClass2 {
  IconData taskIcon;
  String typeOfTask;
  double percentOfTask;
  Color colorOfContainer;
  Color colorOfTaskIcon;
  int numberOfTasks;

  CardClass2({
    required this.taskIcon,
    required this.typeOfTask,
    required this.percentOfTask,
    required this.colorOfContainer,
    required this.colorOfTaskIcon,
    required this.numberOfTasks
  });


}

class TaskCardList2{
  static List<CardClass2> cardClass2 = [
    CardClass2(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      percentOfTask: 70,
      colorOfContainer: Colors.blue.shade400, colorOfTaskIcon: Color(0xfff478b8), numberOfTasks: 23,
    ),
    CardClass2(
      taskIcon: Icons.account_circle,
      typeOfTask: "Personal Project",
      percentOfTask: 52,
      colorOfContainer: const Color(0xffff7d53), colorOfTaskIcon: Color(0xff9260f4), numberOfTasks: 30,
    ),
    CardClass2(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Daily Study",
      percentOfTask: 87,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: Color(0xffff9142), numberOfTasks: 30,
    ),


    CardClass2(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      percentOfTask: 70,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: Color(0xfff478b8), numberOfTasks: 27,
    ),
  ];
}


