import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../main.dart';
import 'account_page.dart';
import 'add_new_task_page.dart';
import 'doing_task_date_page.dart';
import 'home_page.dart';
import 'list_tasks_page.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "home_page";
  final int pageId;
  const BottomNavBar({required this.pageId,super.key});

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
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(widget.pageId.toString() + " << page id");
    if(widget.pageId != 0) {
      pageController = PageController(initialPage: widget.pageId);
      _bottomNavIndex = widget.pageId;
    } else {
      pageController = PageController(initialPage: 0);
    }
  }
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
              Colors.purpleAccent.shade100.withOpacity(0.5),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.yellowAccent.shade100.withOpacity(0.5),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blueAccent.shade100.withOpacity(0.5),
            ],
          ),
        ),
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
             const HomeScreen(),
             const DoingTaskScreen(),
             ListOfTasks(),
            AccountPage(),
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
      bottomNavigationBar: Container(
        color: const Color(0xffeee9ff),
        child: AnimatedBottomNavigationBar(
            backgroundColor: const Color(0xffeee9ff),
            leftCornerRadius: 30,
            rightCornerRadius: 30,
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchMargin: 8,
            activeColor: const Color(0xff5f33e1),
            inactiveColor: const Color(0xffb5a0f3),
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              setState(() {
                _bottomNavIndex = index;
                pageController.jumpToPage(index);
              });
            }
            //other params
            ),
      ),
    );
  }
}
