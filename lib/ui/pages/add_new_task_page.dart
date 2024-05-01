import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
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
  TextEditingController nameOfTaskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  String? nameOfTask;
  String? description;
  String? startDate;
  String? endDate;
  late Tasks tasks;
  HiveService hiveService = HiveService();
  List<Tasks> list1 = [];

  bool isExpanded = false;
  List<String> list = [
    "Work",
    "Personal work",
    "Office Projects",
    "Daily Study",
  ];
  String string = "";

  void setTaskGroup(String taskGroup) {
    setState(() {
      string = taskGroup;
    });
  }

  storeInfo() {
    String nameOfTask = nameOfTaskController.text.trim();
    String description = descriptionController.text.trim();
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();
    if (nameOfTask.isNotEmpty &&
        description.isNotEmpty &&
        startDate.isNotEmpty &&
        endDate.isNotEmpty) {
      Tasks tasks = Tasks(
        nameOfTask: nameOfTask,
        description: description,
        startDate: startDate,
        endDate: endDate,
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
  void initState() {
    super.initState();
    string = list.first;
  }

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
                icon: const Icon(Icons.arrow_back),
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
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 20, right: 20, bottom: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: ExpansionTile(
                  title: ListTile(
                    leading: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xfff478b8).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.local_post_office_rounded,
                        color: Color(0xfff478b8),
                      ),
                    ),
                    subtitle: Text(
                      string,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    // subtitle:

                    title: Text(
                      "Task Group",
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    ),
                  ),
                  children: [
                    Container(
                      height: list.length > 4 ? 50.0 * 5 : 50.0 * list.length,
                      padding:const  EdgeInsets.symmetric(),
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  setTaskGroup(list[index]);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.1,
                                        color: Colors.grey.shade100
                                            .withOpacity(0.7),
                                      ),
                                    ]),
                                height: 25,
                                margin: const EdgeInsets.only(
                                    bottom: 15, left: 15, right: 15),
                                width: double.infinity,
                                child: Text(
                                  "${list[index]}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
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
                          selectedTime = selectedTime.add(const Duration(days: 1));
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
              minimumSize:const  Size(double.infinity, 45)),
          child:const  Text(
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
