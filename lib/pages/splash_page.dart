import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_management_and_to_do_list/pages/bottom_nav_bar.dart';

class SplashPage extends StatefulWidget {
  static const String id="splash_page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff544A71),
      body: Container(
        width: double.infinity,
        color: const Color(0xfff3f0ff),
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              child: const Image(
                image: AssetImage("assets/images/illustrator.png"),
              ),
            )
                .animate()
                .fadeIn() // uses `Animate.defaultDuration`
                .scale() // inherits duration from fadeIn
                .move(delay: 300.ms, duration: 600.ms),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Task Management &\n To-Do List",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff131215),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 30),
              child: Text(
                "This productive tool is designed to help you better manage your task\n project-wise conveniently!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, BottomNavBar.id);
              },
              child: Container(
                height: 48,
                margin:const  EdgeInsets.only(left: 25, right: 25, bottom: 70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color:const  Color(0xff5f33e1),
                ),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Let's start",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, BottomNavBar.id);
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
