import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task_management_and_to_do_list/controllers/nav_controller.dart';
import 'package:task_management_and_to_do_list/controllers/task_controller.dart';
import 'package:task_management_and_to_do_list/model/tasks.dart';
import '../../service/hive_db.dart';
import '../../service/toast.dart';
import 'bottom_nav_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  static const String id = "add_new_task";

  const AddNewTaskScreen({
    super.key,
  });

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final _taskController = Get.put(TaskController());
  final _navController = Get.put(NavController());
  TextEditingController nameOfTaskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController typeOfWhatDoController = TextEditingController();
  String? nameOfTask;
  String? description;
  String? startDate;
  String? endDate;
  String? taskGroup;
  String? typeOFWhatDo="To Do";
  late Tasks tasks;
  HiveService hiveService = HiveService();
  List<Tasks> list1 = [];

  bool isExpanded = false;


  storeInfo() {
    String nameOfTask = nameOfTaskController.text.trim();
    String description = descriptionController.text.trim();
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();
    String typeOFWhatDo = typeOfWhatDoController.text.trim();
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
        taskGroup: taskGroup, typeOfWhatDO: typeOFWhatDo,
      );
      setState(() {
        list1.add(tasks);
      });
      Toast2222.showToast();
    } else {
      Toast2222.showToast2();
    }
  }

  DateTime selectedTime = DateTime.now();

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text(
                "Add Task",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
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
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: Obx(() => Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _taskController.containerColor.value,
                            ),
                            child: Icon(
                              _taskController.iconData.value,
                              color: _taskController.iconColor.value,
                            ),
                          )),
                      title:  Text('Task Group',style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w400,fontSize: 14),),
                      subtitle: Obx(
                        () => Text(
                          _taskController.subtitleText.value.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      trailing: Icon(
                        _navController.customTileExpanded.isFalse
                            ? Icons.arrow_drop_down_sharp
                            : Icons.arrow_drop_up,
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => TextButton(
                                    onPressed: () {
                                      _taskController
                                          .updateIconAndColor("Work");
                                    },
                                    child: Text(
                                        _taskController.subtitleText.value ==
                                                "Work"
                                            ? "Work"
                                            : "Work"),
                                  )),
                              Obx(() => TextButton(
                                    onPressed: () {
                                      _taskController
                                          .updateIconAndColor("Personal tasks");
                                    },
                                    child: Text(
                                        _taskController.subtitleText.value ==
                                                "Personal tasks"
                                            ? "Personal tasks"
                                            : "Personal tasks"),
                                  )),
                              Obx(() => TextButton(
                                    onPressed: () {
                                      _taskController
                                          .updateIconAndColor("Daily Study");
                                    },
                                    child: Text(
                                        _taskController.subtitleText.value ==
                                                "Daily Study"
                                            ? "Daily Study"
                                            : "Daily Study"),
                                  )),
                              Obx(() => TextButton(
                                onPressed: () {
                                  _taskController
                                      .updateIconAndColor("Office Projects");
                                },
                                child: Text(
                                    _taskController.subtitleText.value ==
                                        "Office Projects"
                                        ? "Office Projects"
                                        : "Office Projects"),
                              )),

                            ],
                          ),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        _navController.onExpansionChanged(expanded);
                      },
                    ),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: Center(
                    child: TextField(
                  controller: nameOfTaskController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Task Name",
                    labelStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                )),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer),
                  ], borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    maxLength: 1000,
                    maxLines: 4,
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      counter: const SizedBox(),
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      labelText: "Description",
                      labelStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  )),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer),
                ], borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: startDateController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            initialEntryMode: DatePickerEntryMode.calendar);

                        if (dateTime != null) {
                          setState(() {
                            selectedTime = dateTime;
                          });
                        }
                        startDateController.text = DateFormat("dd/MM/yyyy")
                            .format(selectedTime)
                            .toString();

                        setState(() {
                          selectedTime =
                              selectedTime.add(const Duration(days: 1));
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 40,
                      ),
                    ),
                    prefixIcon: const Icon(IconlyBold.calendar,
                        color: Color(0xff5f33e1)),
                    border: InputBorder.none,
                    labelText: "Start Date",
                    labelStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer),
                ], borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: endDateController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            initialEntryMode: DatePickerEntryMode.calendar);
                        if (dateTime != null) {
                          setState(() {
                            selectedTime = dateTime;
                          });
                        }

                        endDateController.text = DateFormat("dd/MM/yyyy")
                            .format(selectedTime)
                            .toString();
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 40,
                      ),
                    ),
                    prefixIcon: const Icon(IconlyBold.calendar,
                        color: Color(0xff5f33e1)),
                    border: InputBorder.none,
                    labelText: "End Date",
                    labelStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: ElevatedButton(
          onPressed: () async {
            String key = startDateController.text;
            List<Tasks> lst = [];
            if (await hiveService.getTasks(key) == null) {
              storeInfo();
              await hiveService.storeTasks(list1, key);
              Future.delayed(Duration.zero);
            } else {
              for (Tasks item in await hiveService.getTasks(key)) {
                lst.add(item);
              }
              storeInfo();
              lst.add(list1.first);
              hiveService.storeTasks(lst, key);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff5f33e1),
              padding: const EdgeInsets.symmetric(vertical: 12),
              minimumSize: const Size(double.infinity, 45)),
          child: const Text(
            "Add Project",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
