import 'package:attendance/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Models/student_model.dart';

class StudentProvider extends ChangeNotifier{

  String _selectedLanguage = 'English';

  final List<StudentAttendance> _checkedInStudents = [];
  final List<StudentAttendance> _checkedOutStudents = [];
    List<StudentAbsent> _studentAbsent = [];
   List<Student> _filteredStudents = [];



  final List<Student> _students = [
    Student(id: '2020-ABC-5', name: 'Aizan'),
    Student(id: '2021-XYZ-1', name: 'Ali'),
    Student(id: '2021-ABC-6', name: 'John'),
    Student(id: '2020-ABC-11', name: 'Doe'),
    Student(id: '2023-DBC-1', name: 'Mark'),
  ];

  void searchStudents(String query) {
    _filteredStudents = _students.where((student) => student.name.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }


  void addToDatabase() async {
    var box = await Hive.openBox<Student>(AppConstants.databaseName);
    for (var student in _students) {
      box.put(student.id, student);
    }
    await box.close();
  }


  Future<void> fetchDataBaseItems() async {

    final absentDataBase = await Hive.openBox<StudentAbsent>(AppConstants.databaseName);

    try {
      List<StudentAbsent> dataFromDb= absentDataBase.values.toList();
      _studentAbsent= absentDataBase.values.toList();

    } finally {
     await absentDataBase.close();
    }

    notifyListeners();
  }


  void changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void checkIn(int index) {
      _students[index].isCheckedIn = true;

      StudentAttendance attendance = StudentAttendance(
        name: _students[index].name,
        id: _students[index].id,
        time: AppConstants().formatDate(DateTime.now().toString()),
      );

      _checkedInStudents.add(attendance);
      _checkedOutStudents.removeWhere((student) => student.id == attendance.id);

      notifyListeners();
      debugPrint("Checked In at ${attendance.time}");

  }


  void checkOut(int index) {

      _students[index].isCheckedIn = false;
      _students[index].isCheckedOut = true;
      _students[index].checkOutTime = AppConstants().formatDate(DateTime.now().toString());

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

  void markAbsent(int index, DateTime date, {String remark = ""}) async{
    debugPrint('index $index date $date remark $remark');

    StudentAbsent studentAbsent = StudentAbsent(
      id: _students[index].id,
      name: _students[index].name,
      reason: remark,
      time: AppConstants().formatDate(date.toString()),
    );

  //  _studentAbsent.add(studentAbsent);

    final box = await Hive.openBox<StudentAbsent>(AppConstants.databaseName);
    box.add(studentAbsent);
    box.close();

    notifyListeners();
  }

  List<Student> get students => _students;
  List<StudentAttendance> get studentsCheckedIn => _checkedInStudents;
  List<StudentAttendance> get studentsCheckedOut => _checkedOutStudents;
  List<StudentAbsent> get studentsAbsent => _studentAbsent;
  String get selectedLanguage => _selectedLanguage;
  List<Student> get filteredStudents => _filteredStudents;

}