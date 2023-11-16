import 'package:flutter/material.dart';

import '../Models/student_model.dart';

class StudentProvider extends ChangeNotifier{

  final List<StudentAttendance> _checkedInStudents = [];
  final List<StudentAttendance> _checkedOutStudents = [];
  final List<StudentAbsent> _studentAbsent = [];



  final List<Student> _students = [
    Student(id: '2020-ABC-5', name: 'Aizan'),
    Student(id: '2021-XYZ-1', name: 'Ali'),
    Student(id: '2021-ABC-6', name: 'John'),
    Student(id: '2020-ABC-11', name: 'Doe'),
    Student(id: '2023-DBC-1', name: 'Mark'),
  ];

  // void checkIn(int index) {
  //   _students[index].isCheckedIn = true;
  //
  //   checkedInStudents[index].name =  _students[index].name;
  //   checkedInStudents[index].id =  _students[index].id;
  //   checkedInStudents[index].time =  DateTime.now();
  //
  //   notifyListeners();
  //   debugPrint("Checked In at ${DateTime.now()}");
  // }

  void checkIn(int index) {
      _students[index].isCheckedIn = true;

      StudentAttendance attendance = StudentAttendance(
        name: _students[index].name,
        id: _students[index].id,
        time: DateTime.now(),
      );

      _checkedInStudents.add(attendance);
      _checkedOutStudents.removeWhere((student) => student.id == attendance.id);

      notifyListeners();
      debugPrint("Checked In at ${attendance.time}");

  }


  // void checkOut(int index) {
  //
  //   _students[index].isCheckedIn = false;
  //   _students[index].isCheckedOut = true;
  //
  //   _students[index].checkOutTime = DateTime.now();
  //
  //   notifyListeners();
  //   debugPrint("Checked Out at ${_students[index].checkOutTime}");
  // }

  void checkOut(int index) {
      _students[index].isCheckedIn = false;
      _students[index].isCheckedOut = true;
      _students[index].checkOutTime = DateTime.now();

      StudentAttendance attendance = StudentAttendance(
        name: _students[index].name,
        id: _students[index].id,
        time: _students[index].checkOutTime!,
      );

      _checkedOutStudents.add(attendance);
      _checkedInStudents.removeWhere((student) => student.id == attendance.id);

      notifyListeners();
      debugPrint("Checked Out at ${attendance.time}");

  }

  void clearCheckInCheckOut(int index) {
    _students[index].isCheckedIn = false;
    _students[index].isCheckedOut = false;
    notifyListeners();
    debugPrint("Both Checked In and Checked Out cleared");
  }

  void markAbsent(int index, DateTime date, {String remark = ""}) {
    debugPrint('index $index date $date remark $remark');

    StudentAbsent studentAbsent = StudentAbsent(
      id: _students[index].id,
      name: _students[index].name,
      reason: remark,
      time: date,
    );

    _studentAbsent.add(studentAbsent);
    notifyListeners();
  }

  List<Student> get students => _students;
  List<StudentAttendance> get studentsCheckedIn => _checkedInStudents;
  List<StudentAttendance> get studentsCheckedOut => _checkedOutStudents;
  List<StudentAbsent> get studentsAbsent => _studentAbsent;
}