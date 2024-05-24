import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_management_and_to_do_list/model/tasks.dart';

class TaskGroupsCard extends StatefulWidget {
  TaskGroupsCard(
      {required this.taskGroups,
      required this.percentProgress,
      required this.officeTasks,
      super.key});

  final String taskGroups;
  final double percentProgress;
  final List<Tasks> officeTasks;

  @override
  State<TaskGroupsCard> createState() => _TaskGroupsCardState();
}

class _TaskGroupsCardState extends State<TaskGroupsCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: widget.taskGroups=="Work"?Color(0xfff478b8).withOpacity(0.3):widget.taskGroups == "Office Projects"?Colors.blue.withOpacity(0.3):widget.taskGroups == "Daily Study"?Color(
                    0xffff9142).withOpacity(0.3):Color(
                    0xffff7d53).withOpacity(0.3),

                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Icon(
                  widget.taskGroups == "Office Projects"
                      ? Icons.person
                      : widget.taskGroups == "Work"
                          ? Icons.local_post_office_rounded
                          : widget.taskGroups == "Daily Study"
                              ? Icons.book
                              : Icons.account_circle,
                  color: widget.taskGroups=="Work"?Color(0xfff478b8):widget.taskGroups == "Office Projects"?Colors.blue:widget.taskGroups == "Daily Study"?Color(
                      0xffff9142):Color(
                      0xffff7d53),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(widget.taskGroups),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("${widget.officeTasks.length} Tasks"),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 85),
              child: CircularPercentIndicator(
                animation: true,
                radius: 37,
                lineWidth: 7,
                percent: widget.percentProgress,
                progressColor: const Color(0xffeee9ff),
                backgroundColor: const Color(0xffeee9ff).withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
                animationDuration: 1000,
                center: Text(
                  "${widget.percentProgress * 10000 ~/ 10 / 10}%",
                  style: const TextStyle(
                      color: Color(0xffeee9ff), fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
