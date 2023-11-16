import 'package:flutter/material.dart';

import 'package:attendance/Components/AttendanceSummaryComponents/summary_student_card.dart';
import 'package:provider/provider.dart';

import '../../Providers/student_provider.dart';

class AttendanceSummaryComponents extends StatelessWidget {
  const AttendanceSummaryComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Consumer<StudentProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Students Present', style: style),
                Expanded(
                  child: provider.studentsCheckedIn.isEmpty
                      ? const Center(child: Text('No Available students'))
                      : ListView.builder(
                          itemCount: provider.studentsCheckedIn.length,
                          itemBuilder: (context, index) {
                            return SummaryStudentCard(
                              index: index,
                              studentName: provider.studentsCheckedIn[index].name,
                            );
                          }),
                ),
                Text('Students Absent', style: style),
                Expanded(
                  child:  provider.studentsAbsent.isEmpty
                      ? const Center(child: Text('No Record for Absent Students'))
                      : ListView.builder(
                      itemCount: provider.studentsAbsent.length,
                      itemBuilder: (context, index) {
                        return SummaryStudentCard(
                          index: index,
                          studentName: provider.studentsAbsent[index].name,
                          isAbsentSection: true,
                          reason: provider.studentsAbsent[index].reason,
                        );
                      }),
                ),
                Text('Students Checked out', style: style),
                Expanded(
                  child: provider.studentsCheckedOut.isEmpty
                      ? const Center(
                          child:
                              Text('No Record found for checked out students'))
                      : ListView.builder(
                          itemCount: provider.studentsCheckedOut.length,
                          itemBuilder: (context, index) {
                            return SummaryStudentCard(
                              index: index,
                              studentName:
                                  provider.studentsCheckedOut[index].name,
                            );
                          }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

TextStyle get style =>
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
