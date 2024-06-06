
import 'package:hive/hive.dart';
class HiveService1{
  static var myBox=Hive.box("userName");
  static storeInfo(userName) async {
    myBox.put("userName", userName);
  }
  static String? getInfo(String userNameKey) {
    var userName = myBox.get(userNameKey);
    return userName;
  }
}