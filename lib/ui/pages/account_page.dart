import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_management_and_to_do_list/service/hive_service.dart';

import '../../controllers/images_controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final imagePickerController = Get.put(ImagePickerController());
  TextEditingController userNameController = TextEditingController();

  void saveInfo() {
    String userName = userNameController.text.trim();
    if (userName.isNotEmpty) {
      HiveService1.storeInfo(userName);
    } else {
      print("object");
    }
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
  }

  void getInfo() {
    HiveService1.getInfo("userNameKey");
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    userNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final imagePickerController = Get.put(ImagePickerController());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final savedImagePath = await imagePickerController.getSavedImagePath();
      imagePickerController.imagePath.value = savedImagePath;
    });
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 120),
                child: Text(
                  "Data",
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Obx(
                      () => GestureDetector(
                    onTap: imagePickerController.pickImage,
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                          border: imagePickerController.imagePath.value != null
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(110),
                          child: imagePickerController.imagePath.value != null
                              ? Image.file(
                              File(imagePickerController.imagePath.value!),
                              fit: BoxFit.cover)
                              : const Center(child: Text('Tap to select image')),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,bottom: 30),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 15),
                    child: TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "User Name"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ElevatedButton(
                    onPressed: () {
                      saveInfo();
                      getInfo();
                    },
                    child: const Text("Save")),
              ),
            ],
          ),
        )
      ),
    );
  }
}
