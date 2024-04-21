import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreensCards {
  String nameOfTask;
  String typeOfWhatDo;
  String time;
  Color colorOfIcon;
  IconData taskIcon;
  String stateOfTask;
  Color colorOfStateOfTask;

  ScreensCards({
    required this.nameOfTask,
    required this.typeOfWhatDo,
    required this.time,
    required this.colorOfIcon,
    required this.taskIcon,
    required this.stateOfTask,
    required this.colorOfStateOfTask
  });
}

class TaskCardList3 {
  static List<ScreensCards> cardClass3 = [
    ScreensCards(
        nameOfTask: "Grocery shopping app design",
        typeOfWhatDo: "Market Research",
        time: '10:00 AM',
        colorOfIcon: Color(0xfff478b8),
        taskIcon: Icons.local_post_office_rounded, stateOfTask: 'Done', colorOfStateOfTask: Color(0xff8666e9)),
    ScreensCards(
      nameOfTask: "Grocery shopping app design",
      typeOfWhatDo: "Competitive Analysis",
      time: '12:00 PM',
      colorOfIcon: Color(0xfff478b8),
      taskIcon: Icons.local_post_office_rounded, stateOfTask: 'In Progress', colorOfStateOfTask: Color(0xffff9674),
    ),
    ScreensCards(
      nameOfTask: "Uber Eats redesign challenge",
      typeOfWhatDo: "Create Low-fidelity Wireframe",
      time: '07:00 PM',
      colorOfIcon: Color(0xff9260f4),
      taskIcon: Icons.account_circle, stateOfTask: 'To-Do', colorOfStateOfTask: Color(0xff359fff),
    ),
    ScreensCards(
      nameOfTask: "About design sprint",
      typeOfWhatDo: "How to pitch a Design Sprint",
      time: '09:00 PM',
      colorOfIcon: Color(0xffff9142),
      taskIcon: Icons.local_post_office_rounded, stateOfTask: 'To-Do',colorOfStateOfTask: Color(0xff359fff)
    ),
  ];
}
