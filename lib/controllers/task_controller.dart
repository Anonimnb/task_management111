import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var iconColor = Color(0xfff478b8).obs;
  var containerColor = Color(0xfff478b8).withOpacity(0.3).obs;
  var iconData = Icons.local_post_office_rounded.obs;
  var selectedValue = "Work".obs;
  var subtitleText = "Work".obs;

  void onChanged(String value) {
    selectedValue.value = value;
    if (value == "Personal tasks") {
      containerColor.value = Color(0xffff7d53).withOpacity(0.3);
      iconColor.value = Color(0xffff7d53);
      iconData.value = Icons.account_circle;
      subtitleText.value = "Personal tasks";
    } else if (value == "Work") {
      containerColor.value = Color(0xfff478b8).withOpacity(0.3);
      iconColor.value = Color(0xfff478b8);
      iconData.value = Icons.local_post_office_rounded;
      subtitleText.value = "Work";
    } else if (value == "Daily Study") {
      containerColor.value = Color(0xffff9142).withOpacity(0.3);
      iconColor.value = Color(0xffff9142);
      iconData.value = Icons.book;
      subtitleText.value = "Daily Study";
    }else if (value == "Office Projects") {
      containerColor.value = Colors.blue.shade100;
      iconColor.value = Colors.blue;
      iconData.value = Icons.person;
      subtitleText.value = "Office Projects";
    }
  }

  void updateIconAndColor(String taskType) {
    onChanged(taskType);
    iconColor.value == containerColor.value;
  }
}