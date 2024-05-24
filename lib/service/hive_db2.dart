import 'package:hive/hive.dart';

class HiveService2 {
  String boxName = "KeyTasks2";
  String id = "box1keys";

  // key = dd/MM/yyyy

  Future<Box<List>> box() {
    var box = Hive.openBox<List>(boxName);
    return box;
  }

  //Add
  storeTasks2(List newList, String id) async {
    var myBox = await box();
    myBox.put(id, newList);
  }

//Get
  getTasks2(String id) async {
    var myBox = await box();
    List list = [];
    list.addAll(myBox.get(id) ?? []);
    return list;
  }
}
