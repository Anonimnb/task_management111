import 'package:hive/hive.dart';
import 'package:task_management_and_to_do_list/model/doneTasks.dart';

class TasksAdapter2 extends TypeAdapter<DoneTasks> {
  @override
  final int typeId = 2;

  @override
  DoneTasks read(BinaryReader reader) {
    return DoneTasks(

        startDate: reader.readString(),);
  }
  @override
  void write(BinaryWriter writer,DoneTasks obj){
    writer.writeString(obj.startDate);
  }
}
