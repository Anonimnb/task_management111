import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_management_and_to_do_list/classes/task_groups_class.dart';

class TaskGroupsCard extends StatelessWidget {
  const TaskGroupsCard({super.key, required this.taskGroupsClass});

  final TaskGroupsClass taskGroupsClass;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12,left: 20,right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [ BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 8,
        )],
        borderRadius: BorderRadius.circular(20)
      ),
      height: 75,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              height: 45,
              width: 45,
              child: Icon(taskGroupsClass.taskIcon, color: taskGroupsClass.colorOfTaskIcon,size: 32,),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: taskGroupsClass.colorOfTaskIcon.withOpacity(0.4),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 15,left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskGroupsClass.typeOfTask,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height:4,),
                  Text(
                    "${taskGroupsClass.numberOfTasks} Tasks",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff797686),),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 15,top: 15),
              child: CircularPercentIndicator(
                radius: 24,
                lineWidth: 5,
                percent: taskGroupsClass.percentOfTask/100,
                progressColor:taskGroupsClass.colorOfTaskIcon,
                backgroundColor: taskGroupsClass.colorOfTaskIcon.withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${taskGroupsClass.percentOfTask*10~/10}%",
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
