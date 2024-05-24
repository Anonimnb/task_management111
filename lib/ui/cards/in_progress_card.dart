import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/service/hive_db.dart';

import '../../model/tasks.dart';

class InProgressCard extends StatefulWidget {
  final Tasks card;
  final Color cardColor;

  const InProgressCard(
      {required this.card, super.key, required this.cardColor});

  @override
  State<InProgressCard> createState() => _InProgressCardState();
}

class _InProgressCardState extends State<InProgressCard> {
  List<Tasks> projects = [];

  HiveService hiveService = HiveService();

  @override
  Widget build(BuildContext context) {
    return widget.card.typeOfWhatDO == "To Do"
        ? Container(
            width: 250,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.cardColor,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 30,
                    width: 150,
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      widget.card.taskGroup,
                      style: const TextStyle(color: Color(0xff999bac),fontSize: 16),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(
                      right: 20,
                      top: 20,
                    ),
                    child: Row(
                      children: [
                        if (widget.card.taskGroup == "Personal tasks")
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffff7d53).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.account_circle,
                                color: Color(0xffff7d53),
                                size: 20,
                              ),
                            ),
                          ),
                        if (widget.card.taskGroup == "Work")
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xfff478b8).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.local_post_office_rounded,
                                color: Color(0xfff478b8),
                                size: 20,
                              ),
                            ),
                          ),
                        if (widget.card.taskGroup == "Office Projects")
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                          ),
                        if (widget.card.taskGroup == "Daily Study")
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffff9142).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.book,
                                color: Color(0xffff9142),
                                size: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20,top: 40,),
                    height: 80,
                    child: Text(
                      widget.card.nameOfTask,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20,top: 100),
                    height: 80,
                    child: Text(
                     "Do this task until:${widget.card.endDate}",
                      style:  TextStyle(color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                ),

              ],
            ),
          )
        : SizedBox(
            height: 0,
            width: 0,
          );
  }
}
