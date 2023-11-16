import 'package:hive/hive.dart';

import '../Models/student_model.dart';

class StudentAttendanceAdapter extends TypeAdapter<StudentAttendance> {
  @override
  final int typeId = 2;

  @override
  StudentAttendance read(BinaryReader reader) {
    final id = reader.readString();
    final name = reader.readString();
    final time = reader.readString();

    return StudentAttendance(
      id: id,
      name: name,
      time: time,
    );
  }

  @override
  void write(BinaryWriter writer, StudentAttendance obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.time);
  }
}
