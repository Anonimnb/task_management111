// import 'dart:convert';
// import 'dart:developer';
// import 'dart:html';
//
// import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../model/type_of_tasks.dart';
import '../pages/home_page.dart';
import '../view_tasks/screens_card.dart';

// import 'package:task_management_and_to_do_list/classes/screens_cards.dart';
// import 'package:task_management_and_to_do_list/pages/home_page.dart';
// import 'package:task_management_and_to_do_list/view_tasks/screens_card.dart';
//
// import '../model/type_of_tasks.dart';
//
class DoingTaskScreen extends StatefulWidget {
  const DoingTaskScreen({super.key});

  @override
  State<DoingTaskScreen> createState() => _DoingTaskScreenState();
}

class _DoingTaskScreenState extends State<DoingTaskScreen> {
  List<String> list1 = ["All", "To do", "In Progress", "Done"];

  String taskType = "All";
  List<TypeOfTasks> list2 = [];

  sortList() {
    if (taskType == "All") {
      setState(() {
        list2 = ListOfTasks.list;
      });
    } else {
      list2 = [];
      for (TypeOfTasks screensCards in ListOfTasks.list) {
        if (screensCards.stateOfTask == taskType) {
          setState(() {
            list2.add(screensCards);
          });
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sortList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
      SliverAppBar(
            title: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Today's Tasks",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 28,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                },
                headerProps: const EasyHeaderProps(
                  dateFormatter: DateFormatter.fullDateDMY(),
                ),
                dayProps: EasyDayProps(
                  width: 70,
                  height: 90,
                  dayStructure: DayStructure.dayStrDayNumMonth,
                  activeDayStyle: const DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color(0xff5f33e1),
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                            color: Color(0xff5f33e1).withOpacity(0.1),
                            width: 1)),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list1.length + 1,
                itemBuilder: (context, index) {
                  return index == list1.length
                      ? const SizedBox(width: 24)
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              taskType = list1[index];
                              Future.delayed(Duration(milliseconds: 100));
                              sortList();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 24),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            decoration: BoxDecoration(
                              color: list1[index] == taskType
                                  ? Color(0xff5f33e1)
                                  : Color(0xff5f33e1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              list1[index],
                              style: TextStyle(
                                color: list1[index] == taskType
                                    ? Color(0xffeee9ff)
                                    : Color(0xff5f33e1),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: list2.length + 1,
              (context, index) {
                return index == list2.length
                    ? SizedBox(
                        height: 40,
                      )
                    : AllScreen1(screensCards: list2[index]);
              },
            ),
          ),
        ],
      ),
    );

//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             title: const Align(
//               alignment: Alignment.topCenter,
//               child: Text(
//                 "Today's Tasks",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             centerTitle: true,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, HomePage.id);
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.notifications,
//                   size: 28,
//                 ),
//               ),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               child: EasyDateTimeLine(
//                 initialDate: DateTime.now(),
//                 onDateChange: (selectedDate) {
//                   //`selectedDate` the new date selected.
//                 },
//                 headerProps: const EasyHeaderProps(
//                   dateFormatter: DateFormatter.fullDateDMY(),
//                 ),
//                 dayProps: EasyDayProps(
//                   width: 70,
//                   height: 90,
//                   dayStructure: DayStructure.dayStrDayNumMonth,
//                   activeDayStyle: const DayStyle(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                       color: Color(0xff5f33e1),
//                     ),
//                   ),
//                   inactiveDayStyle: DayStyle(
//                     decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(20),
//                         ),
//                         border: Border.all(
//                             color: Color(0xff5f33e1).withOpacity(0.1),
//                             width: 1)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               margin: EdgeInsets.only(top: 20),
//               height: 40,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: list1.length + 1,
//                 itemBuilder: (context, index) {
//                   return index == list1.length
//                       ? const SizedBox(width: 24)
//                       : GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               screensOfTasks = index;
//                               taskType = list1[index];
//                               // sortList();
//                             });
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(left: 24),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 8),
//                             decoration: BoxDecoration(
//                               color: tapped
//                                   ? Color(0xff5f33e1)
//                                   : Color(0xffeee9ff),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Text(list1[index]),
//                           ),
//                         );
//                 },
//               ),
//             ),
//           ),
//           // if (screensOfTasks == 0)
//           //   SliverList(delegate: SliverChildBuilderDelegate((context, index) {
//           //     return AllScreen1(screensCards: TaskCardList3.cardClass3[index]);
//           //   })),
//           // SliverList(delegate: SliverChildBuilderDelegate((context, index){
//           //   return AllScreen1(screensCards: list[index]);
//           // }))
//         ],
//       ),
  }
}
