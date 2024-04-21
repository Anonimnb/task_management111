import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_management_and_to_do_list/classes/task_groups_cards.dart';

class TasksCard2 extends StatelessWidget {
  const TasksCard2({super.key, required this.cardClass2});

  final CardClass2 cardClass2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12,left: 20,right: 20),
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
              margin: EdgeInsets.only(left: 20),
              height: 45,
              width: 45,
              child: Icon(cardClass2.taskIcon, color: cardClass2.colorOfTaskIcon,size: 32,),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: cardClass2.colorOfTaskIcon.withOpacity(0.4),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 15,left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardClass2.typeOfTask,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height:4,),
                  Text(
                    "${cardClass2.numberOfTasks} Tasks",
                    style: TextStyle(
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
              margin: EdgeInsets.only(right: 15,top: 15),
              child: CircularPercentIndicator(
                radius: 24,
                lineWidth: 5,
                percent: cardClass2.percentOfTask/100,
                progressColor:cardClass2.colorOfTaskIcon,
                backgroundColor: cardClass2.colorOfTaskIcon.withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${cardClass2.percentOfTask*10~/10}%",
                  style: TextStyle(
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
