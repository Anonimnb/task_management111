import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../cards/tasks_card.dart';
import '../model/type_of_tasks.dart';
import '../pages/bottom_nav_bar.dart';

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
                Navigator.pushReplacementNamed(context, BottomNavBar.id);
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
                            color: const Color(0xff5f33e1).withOpacity(0.1),
                            width: 1)),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
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
                              Future.delayed(const Duration(milliseconds: 100));
                              sortList();
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 24),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            decoration: BoxDecoration(
                              color: list1[index] == taskType
                                  ? const Color(0xff5f33e1)
                                  : const Color(0xff5f33e1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              list1[index],
                              style: TextStyle(
                                  color: list1[index] == taskType
                                      ? const Color(0xffeee9ff)
                                      : const Color(0xff5f33e1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
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
                    ? const SizedBox(
                        height: 40,
                      )
                    : TasksCard(typeOfTasks: list2[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
