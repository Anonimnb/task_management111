import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task_management_and_to_do_list/screens/account_screen.dart';
import 'package:task_management_and_to_do_list/screens/add_new_task_screen.dart';
import 'package:task_management_and_to_do_list/screens/doing_task_date_screen.dart';
import 'package:task_management_and_to_do_list/screens/home_screen.dart';
import 'package:task_management_and_to_do_list/screens/list_tasks_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "home_page";

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<IconData> iconList = [
    IconlyBold.home,
    IconlyBold.calendar,
    IconlyBold.paper,
    IconlyBold.profile
  ];

  int _bottomNavIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: const [
          HomeScreen(),
          DoingTaskScreen(),
          ListTasksScreen(),
          AccountScreen(),
        ],
        onPageChanged: (int index) {
          setState(
            () {
              _bottomNavIndex = index;
              pageController = PageController(initialPage: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageController = PageController(initialPage: 1);
            Navigator.pushReplacementNamed(context, AddNewTaskScreen.id);
          });
        },
        focusElevation: 50,
        splashColor: Colors.yellow.withOpacity(0.5),
        hoverColor: Colors.yellow,
        focusColor: Colors.cyan,
        backgroundColor: const Color(0xff5f33e1),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
          shadows: [Shadow(offset: Offset.fromDirection(1), blurRadius: 10)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: const Color(0xffeee9ff).withOpacity(0.6),
          //GlassContainer(
          //   child: Padding(
          //     padding: EdgeInsets.all(8),
          //     child: GlassText("Hello World"),
          //   ),
          // ),
          leftCornerRadius: 34,
          rightCornerRadius: 34,
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchMargin: 10,
          activeColor: const Color(0xff5f33e1),
          inactiveColor: const Color(0xffb5a0f3),
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              pageController = PageController(initialPage: index);
              print("Button pressed $index");
            });
          }
          //other params
          ),
    );
  }
}
