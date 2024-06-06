import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_management_and_to_do_list/model/tasks.dart';

class TaskGroupsCard extends StatefulWidget {
  const TaskGroupsCard(
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
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.taskGroups == "Work"
                      ? const Color(0xfff478b8).withOpacity(0.3)
                      : widget.taskGroups == "Office Projects"
                          ? Colors.blue.withOpacity(0.3)
                          : widget.taskGroups == "Daily Study"
                              ? const Color(0xffff9142).withOpacity(0.3)
                              : const Color(0xffff7d53).withOpacity(0.3),
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
                    color: widget.taskGroups == "Work"
                        ? const Color(0xfff478b8)
                        : widget.taskGroups == "Office Projects"
                            ? Colors.blue
                            : widget.taskGroups == "Daily Study"
                                ? const Color(0xffff9142)
                                : const Color(0xffff7d53),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    widget.taskGroups,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("${widget.officeTasks.length} Tasks"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 350),
            child: Align(
              child: Padding(
                padding: const EdgeInsets.only(right: 85),
                child: CircularPercentIndicator(
                  animation: true,
                  radius: 37,
                  lineWidth: 7,
                  percent: widget.percentProgress,
                  progressColor: const Color(0xffeee9ff),
                  backgroundColor: const Color(0xffeee9ff).withOpacity(0.8),
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
          ),
        ],
      ),
    );
  }
}
