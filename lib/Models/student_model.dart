class Student {
  String id;
  String name;
  bool isCheckedIn;
  bool isCheckedOut;
  DateTime? checkOutTime;
  Map<DateTime, String> absentRecords;

  Student({
    required this.id,
    required this.name,
    this.checkOutTime,
    this.absentRecords = const {},
    this.isCheckedIn = false,
    this.isCheckedOut = false,
  });
}

class StudentAttendance {
  String id;
  String name;
  DateTime time;

  StudentAttendance({required this.id, required this.name, required this.time});
}

class StudentAbsent{

  String id;
  String name;
  String reason;
  DateTime time;

  StudentAbsent({required this.id, required this.name, required this.time, required this.reason});
}