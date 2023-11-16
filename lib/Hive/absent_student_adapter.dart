import 'package:hive/hive.dart';

import '../Models/student_model.dart';

class StudentAbsentAdapter extends TypeAdapter<StudentAbsent> {
  @override
  final int typeId = 1;

  @override
  StudentAbsent read(BinaryReader reader) {
    final id = reader.readString();
    final name = reader.readString();
    final reason = reader.readString();
    final time = reader.readString();

    return StudentAbsent(
      id: id,
      name: name,
      reason: reason,
      time: time,
    );
  }

  @override
  void write(BinaryWriter writer, StudentAbsent obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.reason);
    writer.writeString(obj.time);
  }
}
