import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iconly/iconly.dart';
class NavController extends GetxController {
  var tabIndex = 0.obs;
  var customTileExpanded = false.obs;
  var startDate=DateTime.now().obs;
  var endDate=DateTime.now().obs;
  void onExpansionChanged(bool expanded) {
    customTileExpanded.value = expanded;
  }
  void startTimes(DateTime dateTime) {
    startDate.value = dateTime;
  }
  void endTimes(DateTime dateTime) {
    endDate.value = dateTime;
  }
}