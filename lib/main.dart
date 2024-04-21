import 'package:flutter/material.dart';
import 'package:task_management_and_to_do_list/pages/home_page.dart';
import 'package:task_management_and_to_do_list/pages/splash_page.dart';
import 'package:task_management_and_to_do_list/screens/add_new_task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashPage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        SplashPage.id:(context)=>SplashPage(),
        AddNewTaskScreen.id:(context)=>AddNewTaskScreen(),

      },
    );
  }
}

