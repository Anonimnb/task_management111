import 'package:hive/hive.dart';
import 'package:task_management_and_to_do_list/model/tasks.dart';

class TasksAdapter extends TypeAdapter<Tasks> {
  @override
  final int typeId = 1;

  @override
  Tasks read(BinaryReader reader) {
    return Tasks(
        nameOfTask: reader.readString(),
        description: reader.readString(),
        startDate: reader.readString(),
        endDate: reader.readString(), taskGroup: reader.readString(), typeOfWhatDO: reader.readString());
  }
  @override
  void write(BinaryWriter writer,Tasks obj){
    writer.writeString(obj.nameOfTask);
    writer.writeString(obj.description);
    writer.writeString(obj.startDate);
    writer.writeString(obj.endDate);
    writer.writeString(obj.taskGroup);
    writer.writeString(obj.typeOfWhatDO);
  }
}
