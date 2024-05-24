import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/service/hive_db.dart';
import '../../model/tasks.dart';
import '../../service/hive_db2.dart';

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({super.key});

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<Tasks> doneTasks = [];
  HiveService hiveService = HiveService();
  HiveService2 hiveService2 = HiveService2();

  getSavedTasks() async {
    for (String key in await hiveService2.getTasks2("box1keys")) {
      for (Tasks task in await hiveService.getTasks(key)) {
        if (task.typeOfWhatDO == "Done") {
          setState(
            () {
              doneTasks.add(task);
            },
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getSavedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Of Done Tasks'),
      ),
      body: ListView.builder(
        itemCount: doneTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doneTasks[index].nameOfTask),
                Text(doneTasks[index].description),
                Text(doneTasks[index].startDate),
                Text(doneTasks[index].endDate),
              ],
            ),
          );
        },
      ),
    );
  }
}
