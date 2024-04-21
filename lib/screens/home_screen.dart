import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_management_and_to_do_list/classes/in_progress_cards.dart';
import 'package:task_management_and_to_do_list/view_tasks/tasks_card_ver.dart';

import '../classes/task_groups_cards.dart';
import '../view_tasks/tasks_card_hor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double percentProgres = 0.75265;

  //double radius = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: RadialGradient(
        //     center: Alignment.topLeft,
        //     tileMode: TileMode.clamp,
        //     radius: 2,
        //     colors: [
        //       Colors.white,
        //       Colors.white,
        //       Colors.purpleAccent.shade100.withOpacity(0.5),
        //       Colors.white,
        //       Colors.white,
        //       Colors.white,
        //       Colors.white,
        //       Colors.yellowAccent.shade100.withOpacity(0.5),
        //       Colors.white,
        //       Colors.white,
        //       Colors.white,
        //       Colors.white,
        //       Colors.blueAccent.shade100.withOpacity(0.5),
        //     ],
        //   ),
        // ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              sliver: SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: const Image(
                      image: AssetImage("assets/images/man image.jpeg"),
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Yuldoshev Jahongir",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
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
              padding: const EdgeInsets.only(left: 17, right: 17),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff5f33e1),
                  ),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Your today's task\nalmost done!",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 20, left: 20),
                          width: 128,
                          height: 36,
                          child: Text(
                            "View task",
                            style: TextStyle(
                                color: Color(0xff5f33e1), fontSize: 18),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffeee9ff)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 85),
                          child: CircularPercentIndicator(
                            radius: 37,
                            lineWidth: 7,
                            percent: percentProgres,
                            progressColor: Color(0xffeee9ff),
                            backgroundColor: Color(0xffeee9ff).withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${percentProgres * 10000 ~/ 10 / 10}%",
                              style: TextStyle(
                                  color: Color(0xffeee9ff),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 20),
                          height: 30,
                          width: 38,
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.more_horiz,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white60.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                child: Row(
                  children: [
                    const Text(
                      "In Progress",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffeee9ff),
                      ),
                      child: Center(
                        child: Text(
                          "${TaskCardList.cardClass.length}",
                          style: const TextStyle(
                              color: Color(0xff5f33e1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 170,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: TaskCardList.cardClass.length,
                      itemBuilder: (context, index) {
                        return TasksCard(card: TaskCardList.cardClass[index]);
                      }),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Row(
                  children: [
                    const Text(
                      "Task Groups",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffeee9ff),
                      ),
                      child: Center(
                        child: Text(
                          "${TaskCardList2.cardClass2.length}",
                          style: const TextStyle(
                              color: Color(0xff5f33e1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return TasksCard2(
                    cardClass2: TaskCardList2.cardClass2[index],
                  );
                },
                childCount: TaskCardList2.cardClass2.length, // 1000 list items
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget circularImage(Student student) {
//   return ClipOval(
//     child: CachedNetworkImage(
//       imageUrl: student.imageUrl,
//       width: radius * 2,
//       height: radius * 2,
//       fit: BoxFit.cover,
//       placeholder: (context, url) => CircularProgressIndicator(),
//       errorWidget: (context, url, error) => Icon(Icons.error),
//     ),
//   );
// }
}
