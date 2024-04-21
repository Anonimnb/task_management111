
import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/pages/bottom_nav_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  static const String id = "add_new_task";

  const AddNewTaskScreen({
    super.key,
  });

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
            title: const Text(
              "Add Project",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, BottomNavBar.id);
              },
              icon:const  Icon(Icons.arrow_back),
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
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              child: ListTile(
                leading: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xfff478b8).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.local_post_office_rounded,
                    color: Color(0xfff478b8),
                  ),
                ),
                subtitle: const Text(
                  "Work",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                // subtitle:

                title: Text(
                  "Task Group",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon:const  Icon(Icons.arrow_drop_down_sharp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
