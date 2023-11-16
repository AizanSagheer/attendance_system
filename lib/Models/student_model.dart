class Student {
  String id;
  String name;
  bool isCheckedIn;
  bool isCheckedOut;
  String? checkOutTime;

  Student({
    required this.id,
    required this.name,
    this.checkOutTime,
    this.isCheckedIn = false,
    this.isCheckedOut = false,
  });
}

class StudentAttendance {
  String id;
  String name;
  String time;

  StudentAttendance({required this.id, required this.name, required this.time});
}

class StudentAbsent{

  String id;
  String name;
  String reason;
  String time;

  StudentAbsent({required this.id, required this.name, required this.time, required this.reason});
}