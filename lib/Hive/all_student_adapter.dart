import 'package:hive/hive.dart';

import '../Models/student_model.dart';


class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 0;

  @override
  Student read(BinaryReader reader) {
    final id = reader.readString();
    final name = reader.readString();
    final isCheckedIn = reader.readBool();
    final isCheckedOut = reader.readBool();
    final checkOutTime = reader.readString();

    return Student(
      id: id,
      name: name,
      isCheckedIn: isCheckedIn,
      isCheckedOut: isCheckedOut,
      checkOutTime: checkOutTime,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeBool(obj.isCheckedIn);
    writer.writeBool(obj.isCheckedOut);
    writer.writeString(obj.checkOutTime!);
  }
}
