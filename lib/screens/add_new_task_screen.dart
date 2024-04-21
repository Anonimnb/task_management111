// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/pages/home_page.dart';

class AddNewTaskScreen extends StatefulWidget {
  static const String id = "add_new_task";

  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Add Project",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              icon: Icon(Icons.arrow_back),
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
        ],
      ),
    );
  }
}
