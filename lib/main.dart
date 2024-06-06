import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_management_and_to_do_list/model/doneTasks.dart';
import 'package:task_management_and_to_do_list/service/hive_db.g.dart';
import 'package:task_management_and_to_do_list/service/hive_db2.g.dart';
import 'package:task_management_and_to_do_list/ui/pages/bottom_nav_bar.dart';
import 'package:task_management_and_to_do_list/ui/pages/splash_page.dart';
import 'package:task_management_and_to_do_list/ui/pages/add_new_task_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'model/tasks.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('ImageData');
  await Hive.initFlutter();
  await Hive.openBox("UserName");
  Hive.registerAdapter(TasksAdapter());
  await Hive.openBox<Tasks>("Tasks");
  Hive.registerAdapter(TasksAdapter2());
  await Hive.openBox<DoneTasks>("DoneTasks");
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      routes: {
        BottomNavBar.id: (context) => BottomNavBar(pageId: 0,),
        SplashPage.id: (context) => const SplashPage(),
        AddNewTaskScreen.id: (context) => const AddNewTaskScreen(),
      },
    );
  }
}
