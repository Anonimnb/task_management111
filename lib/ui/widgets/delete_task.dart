import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/model/tasks.dart';
import 'package:task_management_and_to_do_list/service/hive_db.dart';
import 'package:task_management_and_to_do_list/service/toast.dart';
import 'package:task_management_and_to_do_list/ui/pages/bottom_nav_bar.dart';

HiveService hiveService = HiveService();

void showCupertinoDialogExample(
    BuildContext context, String key, int itemId, List<Tasks> projects) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: const Text(
          "Do you want to delete this task?",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text("Yes"),
            onPressed: () async {
              projects.removeAt(itemId);
              hiveService.storeTasks(projects, key);
              Toast2222.showToast5();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BottomNavBar(pageId: 1)));
              log("delete task");
            },
          ),
        ],
      );
    },
  );
}
