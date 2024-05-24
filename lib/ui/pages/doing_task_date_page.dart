import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_and_to_do_list/ui/pages/task_details.dart';
import 'package:task_management_and_to_do_list/ui/widgets/delete_task.dart';
import '../../model/tasks.dart';
import '../../service/hive_db.dart';
import 'bottom_nav_bar.dart';

class DoingTaskScreen extends StatefulWidget {
  const DoingTaskScreen({super.key});

  @override
  State<DoingTaskScreen> createState() => _DoingTaskScreenState();
}

class _DoingTaskScreenState extends State<DoingTaskScreen> {
  List<String> list1 = ["All", "To Do", "Done"];
  List<Tasks> projects = [];
  HiveService hiveService = HiveService();
  String taskType = "All";
  String selectedTime = "";

  sortList(String key) async {
    if (taskType == "All") {
      projects = [];
      for (Tasks screensCards in await hiveService.getTasks(key)) {
          setState(() {
            projects.add(screensCards);
          });

      }
    } else {
      projects = [];
      for (Tasks screensCards in await hiveService.getTasks(key)) {
        if (screensCards.typeOfWhatDO == taskType) {
          setState(() {
            projects.add(screensCards);
          });
        }
      }
    }
  }

  getSavedTasks(String key) async {
    projects=[];
    for (Tasks item in await hiveService.getTasks(key)) {
      setState(() {
        projects.add(item);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DateTime time = DateTime.now();
    String key = DateFormat("dd/MM/yyyy").format(time);
    getSavedTasks(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            tileMode: TileMode.clamp,
            radius: 2,
            colors: [
              Colors.white,
              Colors.white,
              Colors.purpleAccent.shade100.withOpacity(0.1),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.yellowAccent.shade100.withOpacity(0.1),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blueAccent.shade100.withOpacity(0.1),
            ],
          ),
        ),
        child: CustomScrollView(
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
                icon: SvgPicture.asset("assets/images/arrow-left.svg"),
              ),
              actions: [
                SizedBox(
                  height: 56,
                  width: 56,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/notification.svg",
                          height: 28,
                          width: 28,
                        ),
                      ),
                      //If yozish kk notification bulsa chiqadi bulmasa yoq;
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, right: 23),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: const Color(0xff5f33e1),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    selectedTime =
                        DateFormat("dd/MM/yyyy").format(selectedDate);
                    String key = DateFormat("dd/MM/yyyy").format(selectedDate);

                    getSavedTasks(key);
                    setState(() {
                      taskType="All";
                    });
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
                                Future.delayed(
                                    const Duration(milliseconds: 100));

                                sortList(selectedTime);
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
            if (projects.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: projects.length + 1,
                  (context, index) {
                    return index == projects.length
                        ? const SizedBox(
                            height: 40,
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.off(
                                TaskDetails(
                                  tasks: projects[index],
                                  taskIndex: index,
                                ),
                              );
                              // showModalBottomSheet(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return SizedBox(
                              //       height: MediaQuery.of(context).size.height,
                              //       child: Center(
                              //         child: ElevatedButton(
                              //             onPressed: () {
                              //               Navigator.pop(context);
                              //             },
                              //             child: const Text("Close")),
                              //       ),
                              //     );
                              //   },
                              // );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset.infinite,
                                    color: Colors.grey,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    height: 120,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text(
                                                projects[index].nameOfTask,
                                                style: const TextStyle(
                                                    color: Color(0xffbab8c1),
                                                    fontSize: 16),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text(
                                                projects[index].taskGroup,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 15, bottom: 8),
                                            height: 36,
                                            width: 36,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.brown.shade100),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    showCupertinoDialogExample(
                                                      context,
                                                      selectedTime,
                                                      index,
                                                      projects,
                                                    );
                                                  });
                                                },
                                                icon: const Center(
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.brown,
                                                    size: 24,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 15, bottom: 15),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.watch_later,
                                                  color: const Color(0xff9260f4)
                                                      .withOpacity(0.4),
                                                  size: 20,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  projects[index].startDate,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff9260f4)
                                                            .withOpacity(0.4),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 25,
                                            width: 20,
                                            margin: const EdgeInsets.only(
                                              right: 15,
                                              top: 5,
                                            ),
                                            child: Row(
                                              children: [
                                                if (projects[index].taskGroup ==
                                                    "Personal tasks")
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xffff7d53)
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.account_circle,
                                                        color:
                                                            Color(0xffff7d53),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                if (projects[index].taskGroup ==
                                                    "Work")
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xfff478b8)
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons
                                                            .local_post_office_rounded,
                                                        color:
                                                            Color(0xfff478b8),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                if (projects[index].taskGroup ==
                                                    "Office Projects")
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.blue.shade100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                if (projects[index].taskGroup ==
                                                    "Daily Study")
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xffff9142)
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.book,
                                                        color:
                                                            Color(0xffff9142),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: 25,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff359fff)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            margin: const EdgeInsets.only(
                                                right: 15, bottom: 15),
                                            child: Center(
                                              child: Text(
                                                projects[index].typeOfWhatDO,
                                                style: const TextStyle(
                                                    color: Color(0xff359fff),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
            if (projects.isEmpty)
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 150),
                  child: SvgPicture.asset(
                    "assets/images/not found image.svg",
                    height: 100,
                    width: 100,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
