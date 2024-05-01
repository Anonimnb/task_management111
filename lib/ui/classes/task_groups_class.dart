import 'package:flutter/material.dart';

class TaskGroupsClass {
  IconData taskIcon;
  String typeOfTask;
  double percentOfTask;
  Color colorOfContainer;
  Color colorOfTaskIcon;
  int numberOfTasks;

  TaskGroupsClass({
    required this.taskIcon,
    required this.typeOfTask,
    required this.percentOfTask,
    required this.colorOfContainer,
    required this.colorOfTaskIcon,
    required this.numberOfTasks
  });


}

class TaskGroupsList{
  static List<TaskGroupsClass> list = [
    TaskGroupsClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      percentOfTask: 70,
      colorOfContainer: Colors.blue.shade400, colorOfTaskIcon: const Color(0xfff478b8), numberOfTasks: 23,
    ),
    TaskGroupsClass(
      taskIcon: Icons.account_circle,
      typeOfTask: "Personal Project",
      percentOfTask: 52,
      colorOfContainer: const Color(0xffff7d53), colorOfTaskIcon: const Color(0xff9260f4), numberOfTasks: 30,
    ),
    TaskGroupsClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Daily Study",
      percentOfTask: 87,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: const Color(0xffff9142), numberOfTasks: 30,
    ),


    TaskGroupsClass(
      taskIcon: Icons.local_post_office_rounded,
      typeOfTask: "Office Project",
      percentOfTask: 70,
      colorOfContainer: const Color(0xffe7f3ff), colorOfTaskIcon: const Color(0xfff478b8), numberOfTasks: 27,
    ),
  ];
}


