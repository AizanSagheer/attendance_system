import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/student_provider.dart';

class StudentsListWidget extends StatelessWidget {
  const StudentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, studentsProvider, child) {
        return ListView.builder(
          itemCount: studentsProvider.students.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Text("${index + 1}"),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" ${studentsProvider.students[index].name}"),
                        Text(" ${studentsProvider.students[index].id}"),
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                trailing: studentsProvider.students[index].isCheckedIn
                    ? ElevatedButton(
                        onPressed: () {
                          studentsProvider.checkOut(index);
                        },
                        child: const Text('Check Out'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          studentsProvider.checkIn(index);
                        },
                        child: const Text('Check In'),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}