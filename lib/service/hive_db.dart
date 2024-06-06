import 'package:hive/hive.dart';

class HiveService {
  String boxName = "KeyTasks";
  String id = "key";

  Future<Box<List>> box() {
    var box = Hive.openBox<List>(boxName);
    return box;
  }

  storeTasks(List newList, String id) async {
    var myBox = await box();
    myBox.put(id, newList);
  }

  getTasks(String id) async {
    var myBox = await box();
    List list = [];
    list.addAll(myBox.get(id) ?? []);
    return list;
  }
  deleteTasks(String id) async{
    var myBox=await box();
    myBox.delete(id);
  }
}
