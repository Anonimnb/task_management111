import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/service/hive_db.dart';
import '../../model/tasks.dart';

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({super.key});

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<Tasks> projects = [];
  HiveService hiveService = HiveService();

  getSavedTasks() async {
    for (Tasks item in await hiveService.getTasks("key")) {
      setState(() {
        projects.add(item);
      });
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
        title:const  Text('Next Page'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const  EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(projects[index].nameOfTask),
                Text(projects[index].description),
                Text(projects[index].startDate),
                Text(projects[index].endDate),
              ],
            ),
          );
        },
      ),
    );
  }
}

