import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../controllers/images_controller.dart';
import '../../model/tasks.dart';
import '../../service/hive_db.dart';
import '../../service/hive_db2.dart';
import '../cards/in_progress_card.dart';
import '../classes/task_groups_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tasks> officeProjects = [];
  List<Tasks> personalProjects = [];
  List<Tasks> dailyStudyProjects = [];
  List<Tasks> workProjects = [];
  List<double> percentProgressList = [0, 0, 0, 0];

  HiveService hiveService = HiveService();
  HiveService2 hiveService2 = HiveService2();
  final imagePickerController = Get.put(ImagePickerController());

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
        if (task.taskGroup == "Work") {
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
  List<Color> listOfColors = [
    Colors.blue.shade50,
    Colors.orange.shade50,
    Colors.blueGrey.shade50,
    Colors.purple.shade50
  ];
  List<Tasks> listPercent = [];
  double percentProgress = 0.0;
  double percentProgress1 = 0.0;
  double percentProgress2 = 0.0;
  double percentProgress3 = 0.0;
  double percentProgress4 = 0.0;

  int doneCount1=0;
  int doneCount2=0;
  int doneCount3=0;
  int doneCount4=0;
  int doneCount=0;

  getStart() async {
    DateTime time = DateTime.now();

    String key = DateFormat("dd/MM/yyyy").format(time);
    for (Tasks screensCards in await hiveService.getTasks(key)) {
      setState(() {
        listPercent.add(screensCards);
      });
    }
    int allCount = listPercent.length;
    for (Tasks item in await listPercent) {
      if (item.typeOfWhatDO == "Done"&& item.taskGroup=="Work") {
        doneCount1++;
      }else if(item.typeOfWhatDO == "Done"&& item.taskGroup=="Office Projects"){
        doneCount2++;
      }else if(item.typeOfWhatDO == "Done"&& item.taskGroup=="Daily Study"){
        doneCount3++;
      }else if(item.typeOfWhatDO == "Done"&& item.taskGroup=="Personal tasks"){
        doneCount4++;
      }
    }
    setState(() {
      doneCount=doneCount4+doneCount3+doneCount2+doneCount1;
      if (allCount != 0) percentProgress = doneCount / allCount;
      if (allCount != 0) percentProgress1 = doneCount1 / allCount;
      if (allCount != 0) percentProgress2 = doneCount2 / allCount;
      if (allCount != 0) percentProgress3 = doneCount3 / allCount;
      if (allCount != 0) percentProgress4 = doneCount4 / allCount;

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
    final imagePickerController = Get.put(ImagePickerController());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final savedImagePath = await imagePickerController.getSavedImagePath();
      imagePickerController.imagePath.value = savedImagePath;
    });
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
                  child: Obx(
                        () => GestureDetector(
                      onTap: imagePickerController.pickImage,
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(110),
                            border: imagePickerController.imagePath.value != null
                                ? null
                                : Border.all(color: Colors.grey),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(110),
                            child: imagePickerController.imagePath.value != null
                                ? Image.file(
                                File(imagePickerController.imagePath.value!),fit: BoxFit.cover)
                                : const Center(child: Text('Tap to select image')),
                          )),
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
                      "User Name",
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
                       Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Your today's tasks\nalmost done",
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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.local_post_office_rounded,
                            color: Colors.blue,
                            size: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade100,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, left: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Office Projects",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "$doneCount2 Tasks",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff797686),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 15),
                          child: CircularPercentIndicator(
                            radius: 27,
                            lineWidth: 5,
                            percent: percentProgress2,
                            progressColor: const Color(0xfff478b8),
                            backgroundColor: const Color(0xfff478b8).withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${(percentProgress2*100).toStringAsFixed(1)} %",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.account_circle,
                            color: Color(0xffff7d53),
                            size: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffff7d53).withOpacity(0.3),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, left: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Personal Project",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "$doneCount4 Tasks",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff797686),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 15),
                          child: CircularPercentIndicator(
                            radius: 27,
                            lineWidth: 5,
                            percent: percentProgress4,
                            progressColor: const Color(0xfff478b8),
                            backgroundColor: const Color(0xfff478b8).withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${(percentProgress4*100).toStringAsFixed(1)} %",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.person,
                            color:Color(0xfff478b8),
                            size: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff478b8).withOpacity(0.3),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, left: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Work",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "$doneCount1 Tasks",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff797686),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 15),
                          child: CircularPercentIndicator(
                            radius: 27
                            ,
                            lineWidth: 5,
                            percent: percentProgress1,
                            progressColor: const Color(0xfff478b8),
                            backgroundColor: const Color(0xfff478b8).withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${(percentProgress1*100).toStringAsFixed(1)} %",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.book,
                            color: Color(0xffff9142),
                            size: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffff9142).withOpacity(0.3),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, left: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Daily Study",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "$doneCount3 Tasks",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff797686),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 15),
                          child: CircularPercentIndicator(
                            radius: 27,
                            lineWidth: 5,
                            percent: percentProgress3,
                            progressColor: const Color(0xfff478b8),
                            backgroundColor: const Color(0xfff478b8).withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${(percentProgress3*100).toStringAsFixed(1)} %",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
