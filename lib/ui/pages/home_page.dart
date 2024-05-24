import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../model/tasks.dart';
import '../../service/hive_db.dart';
import '../../service/hive_db2.dart';
import '../cards/in_progress_card.dart';
import '../cards/task_groups_card.dart';
import '../classes/task_groups_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //////////////////*******************************
  List<Tasks> officeProjects = [];
  List<Tasks> personalProjects = [];
  List<Tasks> dailyStudyProjects = [];
  List<Tasks> workProjects = [];
  List<double> percentProgressList = [0, 0, 0, 0];

  HiveService hiveService = HiveService();
  HiveService2 hiveService2 = HiveService2();

  getSavedTasks() async {
    for (String key in await hiveService2.getTasks2("box1keys")) {
      for (Tasks task in await hiveService.getTasks(key)) {
        if (task.taskGroup == "Office Projects") {
          setState(
            () {
              officeProjects.add(task);
            },
          );
        }
        if (task.taskGroup == "Personal tasks") {
          setState(
            () {
              personalProjects.add(task);
            },
          );
        }
        if (task.taskGroup == "Work"
            ) {
          setState(
            () {
              workProjects.add(task);
            },
          );
        }
        if (task.taskGroup == "Daily Study") {
          setState(
            () {
              dailyStudyProjects.add(task);
            },
          );
        }
      }
    }
    int allCount = officeProjects.length;
    int doneCount = 0;
    for (Tasks item in await officeProjects) {
      if (item.typeOfWhatDO == "Done") {
        doneCount++;
      }
    }
    setState(() {
      if (allCount != 0) percentProgressList[0] = doneCount / allCount;
    });
  }

  ///////////////***********************************

  projectsCount() async {
    for (String key in await hiveService2.getTasks2("box1keys")) {
      for (Tasks task in await hiveService.getTasks(key)) {
        if (task.typeOfWhatDO == "Done" && task.typeOfWhatDO == "To Do") {
          setState(
            () {
              officeProjects.add(task);
            },
          );
        }
        switch (task.taskGroup) {
          case "Office Project":
            {
              officeProjects.add(task);
              if (task.typeOfWhatDO == "Done") {
                percentProgressList[0]++;
              }
            }
            break;
          case "Personal Project":
            {
              personalProjects.add(task);
              if (task.typeOfWhatDO == "Done") {
                percentProgressList[1]++;
              }
            }
            break;
          case "Daily Study":
            {
              officeProjects.add(task);
              if (task.typeOfWhatDO == "Done") {
                percentProgressList[2]++;
              }
            }
            break;
          case "Work":
            {
              officeProjects.add(task);
              if (task.typeOfWhatDO == "Done") {
                percentProgressList[3]++;
              }
            }
            break;
        }
      }
    }
  }

  ///////////////***********************************
  List<Color> listOfColors = [
    Colors.blue.shade50,
    Colors.orange.shade50,
    Colors.blueGrey.shade50,
    Colors.purple.shade50
  ];
  List<Tasks> listPercent = [];
  double percentProgress = 0.0;

  getStart() async {
    DateTime time = DateTime.now();

    String key = DateFormat("dd/MM/yyyy").format(time);
    for (Tasks screensCards in await hiveService.getTasks(key)) {
      setState(() {
        listPercent.add(screensCards);
      });
    }
    int allCount = listPercent.length;
    int doneCount = 0;
    for (Tasks item in await listPercent) {
      if (item.typeOfWhatDO == "Done") {
        doneCount++;
      }
    }
    setState(() {
      if (allCount != 0) percentProgress = doneCount / allCount;
    });
  }

  @override
  void initState() {
    super.initState();
    getStart();
    getSavedTasks();
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
            SliverPadding(
              sliver: SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: const Image(
                      image: AssetImage("assets/images/man image.jpeg"),
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Yuldoshev Jahongir",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
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
                        //If yozish kk notification bulsa;
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
              padding: const EdgeInsets.only(left: 17, right: 17),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xff5f33e1),
                  ),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Your today's task\nalmost done!",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 20, left: 20),
                            width: 128,
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffeee9ff)),
                            child: const Text(
                              "View task",
                              style: TextStyle(
                                  color: Color(0xff5f33e1), fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 85),
                          child: CircularPercentIndicator(
                            animation: true,
                            radius: 37,
                            lineWidth: 7,
                            percent: percentProgress,
                            progressColor: const Color(0xffeee9ff),
                            backgroundColor:
                                const Color(0xffeee9ff).withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            animationDuration: 1000,
                            center: listPercent.isNotEmpty
                                ? Text(
                                    "${percentProgress * 10000 ~/ 10 / 10}%",
                                    style: const TextStyle(
                                        color: Color(0xffeee9ff),
                                        fontWeight: FontWeight.w500),
                                  )
                                : SvgPicture.asset(
                                    "assets/images/dead_emoji.svg",
                                    height: 40,
                                    width: 40,
                                  ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 20),
                          height: 30,
                          width: 38,
                          decoration: BoxDecoration(
                            color: Colors.white60.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.more_horiz,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///*******************************
            //In progress
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 10),
                child: Row(
                  children: [
                    const Text(
                      "In Progress",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffeee9ff),
                      ),
                      child: Center(
                        child: Text(
                          "${listPercent.length}",
                          style: const TextStyle(
                              color: Color(0xff5f33e1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listPercent.length + 1,
                    itemBuilder: (context, index) {
                      return index == listPercent.length
                          ? const SizedBox(width: 60)
                          : InProgressCard(
                              card: listPercent[index],
                              cardColor: listOfColors[index % 4],
                            );
                    },
                  ),
                ),
              ),
            ),

            ///********************************
            //Task Groups
            ///********************************
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Row(
                  children: [
                    const Text(
                      "Task Groups",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffeee9ff),
                      ),
                      child: Center(
                        child: Text(
                          "${TaskGroupsList.list.length}",
                          style: const TextStyle(
                              color: Color(0xff5f33e1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
                  height: 1000,
                  child: ListView(
                                children: [
                  Container(
                    height: 120,
                    width: double.infinity,

                    child: TaskGroupsCard(
                      percentProgress: percentProgressList[0],
                      officeTasks: officeProjects,
                      taskGroups: 'Office Projects',
                    ),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,


                    child: TaskGroupsCard(
                      percentProgress: percentProgressList[1],
                      officeTasks: personalProjects,
                      taskGroups: 'Work',
                    ),
                  ),
                  Container(
                    height: 120,
                  width: double.infinity,
                    child: TaskGroupsCard(
                      percentProgress: percentProgressList[2],
                      officeTasks: dailyStudyProjects,
                      taskGroups: 'Personal tasks',
                    ),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,

                    child: TaskGroupsCard(
                      percentProgress: percentProgressList[3],
                      officeTasks: workProjects,
                      taskGroups: 'Daily Study',
                    ),
                  ),
                                ],
                              ),
                ))

            ///********************************
          ],
        ),
      ),
    );
  }
}
