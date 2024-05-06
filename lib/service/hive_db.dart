import 'package:hive/hive.dart';

class HiveService {
  String boxName = "KeyTasks";
  String id = "key";

  // key = dd/MM/yyyy

  Future<Box<List>> box() {
    var box = Hive.openBox<List>(boxName);
    return box;
  }

  //Add
  storeTasks(List newList, String id) async {
    var myBox = await box();
    myBox.put(id, newList);
  }

//Get
  getTasks(String id) async {
    var myBox = await box();
    List list = [];
    list.addAll(myBox.get(id) ?? []);
    return list;
  }
}
