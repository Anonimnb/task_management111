import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/ui/classes/type_of_tasks.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({super.key, required this.typeOfTasks});

  final TypeOfTasks typeOfTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, right: 24, left: 24, bottom: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      height: 120,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                typeOfTasks.nameOfTask,
                style: const TextStyle(color: Color(0xffbab8c1)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 36,
              width: 36,
              margin: const EdgeInsets.only(right: 15, top: 15),
              decoration: BoxDecoration(
                color: typeOfTasks.colorOfIcon.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                typeOfTasks.taskIcon,
                color: typeOfTasks.colorOfIcon,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: Text(
                typeOfTasks.typeOfWhatDo,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.timer_rounded,
                    color: const Color(0xff9260f4).withOpacity(0.4),
                  ),
                  Text(
                    typeOfTasks.time,
                    style: TextStyle(
                      color: const Color(0xff9260f4).withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: typeOfTasks.colorOfStateOfTask.withOpacity(0.2)),
              child: Text(
                typeOfTasks.stateOfTask,
                style: TextStyle(
                    color: typeOfTasks.colorOfStateOfTask, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
