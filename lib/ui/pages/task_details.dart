import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_management_and_to_do_list/model/tasks.dart';
import 'package:task_management_and_to_do_list/ui/pages/doing_task_date_page.dart';

import '../../controllers/task_controller.dart';
import '../../service/hive_db.dart';
import '../../service/toast.dart';

class TaskDetails extends StatefulWidget {
  Tasks tasks;
  int taskIndex;

  TaskDetails({required this.tasks, required this.taskIndex, super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  String _typeOfWhatDO = "To-Do";
  final _taskController = Get.put(TaskController());

  TextEditingController nameOfTaskController = TextEditingController();
  TextEditingController taskGroupController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeOfWhatDoController = TextEditingController();
  HiveService hiveService = HiveService();

  List<Tasks> projects = [];

  storeInfo(String typeOfWhatDO) async {
    String nameOfTask = nameOfTaskController.text.trim();
    String description = descriptionController.text.trim();
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();
    String taskGroup = _taskController.subtitleText.toString();
    if (nameOfTask.isNotEmpty &&
        description.isNotEmpty &&
        startDate.isNotEmpty &&
        endDate.isNotEmpty) {
      Tasks tasks = Tasks(
        nameOfTask: nameOfTask,
        description: description,
        startDate: startDate,
        endDate: endDate,
        taskGroup: taskGroup,
        typeOfWhatDO: typeOfWhatDO,
      );
      for (Tasks item in await hiveService.getTasks(widget.tasks.startDate)) {
        setState(() {
          projects.add(item);
        });
      }
      setState(() {
        projects[widget.taskIndex] = tasks;
      });
      Toast2222.showToast3();
    } else {
      Toast2222.showToast4();
    }
  }

  DateTime selectedTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    initialDescription();
    initialTaskName();
    initialTasKGroup();
    initialStartDate();
    initialEndDate();
  }

  void initialDescription() {
    descriptionController.text = widget.tasks.description;
  }

  void initialTaskName() {
    nameOfTaskController.text = widget.tasks.nameOfTask;
  }

  void initialTasKGroup() {
    taskGroupController.text = widget.tasks.taskGroup;
  }

  void initialStartDate() {
    startDateController.text = widget.tasks.startDate;
  }

  void initialEndDate() {
    endDateController.text = widget.tasks.endDate;
  }
  void _updateTaskState(String newTypeOfWhatDO) {
    setState(() {
      _typeOfWhatDO = newTypeOfWhatDO;
    });
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
              Colors.purpleAccent.shade100.withOpacity(0.2),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.yellowAccent.shade100.withOpacity(0.2),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blueAccent.shade100.withOpacity(0.2),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text(
                "Task Details",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Get.off(const DoingTaskScreen());
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
                    ],
                  ),
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.08),
                ),
                child: TextField(
                  controller: nameOfTaskController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Task Name",
                    hintStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    labelText: "Task Name",
                    labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    suffixIcon: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.08),
                ),
                child: TextField(
                  controller: taskGroupController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Task Group",
                    hintStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    labelText: "Task Group",
                    labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    suffixIcon: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.08),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: startDateController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Start Date",
                          hintStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                          labelText: "Start Date",
                          labelStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: endDateController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "End Date",
                          hintStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          border: InputBorder.none,
                          labelText: "End Date",
                          labelStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.08),
                ),
                child: TextField(
                  maxLength: 1000,
                  maxLines: 3,
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    counter: const SizedBox(),
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    labelText: "Description",
                    labelStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 18),
                    suffixIcon: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                    right: 20, left: 20, top: 0, bottom: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.08),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your task's state is ${widget.tasks.typeOfWhatDO}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          "If your task is done, tap on this button",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        Row(
                          children: [
                            Text(
                              "to change your task's state!",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xff8666e9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:  Center(
                                child: Text(
                                  _typeOfWhatDO.toString(),
                                  style: const TextStyle(color: Color(0xff8666e9)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
                child: GestureDetector(
              onTap: () async {
                _updateTaskState("To-Do");
                String key = widget.tasks.startDate;
                await storeInfo("To-Do");
                hiveService.storeTasks(projects, key);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "To-Do",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )),
            SliverToBoxAdapter(
                child: GestureDetector(
              onTap: () async {
                _updateTaskState("Done");
                String key = widget.tasks.startDate;
                await storeInfo("Done");
                hiveService.storeTasks(projects, key);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Done",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
