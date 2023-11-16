import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Models/student_model.dart';
import '../../Providers/student_provider.dart';
import '../../Utils/app_constants.dart';

class AbsentListWidget extends StatelessWidget {
  final int index;

  const AbsentListWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, studentsProvider, child) {
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showMarkAbsentDialog(context, studentsProvider, index),
                  child: const Text('Absent'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _showCheckAbsentRecordDialog(context, studentsProvider, index),
                  child: const Text('Record'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMarkAbsentDialog(BuildContext context, StudentProvider studentsProvider, int index) async {
    DateTime selectedDate = DateTime.now();
    String remark = "";

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add reason of absence'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                      remark = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Reason (Optional)',
                  ),
                  maxLength: 10,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  studentsProvider.markAbsent(index, selectedDate, remark: remark);
                  Navigator.of(context).pop();
                },
                child: const Text('Mark Absent'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _showCheckAbsentRecordDialog(BuildContext context, StudentProvider studentsProvider, int index) async {
    String studentId = studentsProvider.students[index].id;

    List<StudentAbsent> matchingRecords = studentsProvider.studentsAbsent
        .where((record) => record.id == studentId)
        .toList();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Absent Records'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                matchingRecords.isEmpty
                    ? const Text('No Record')
                    : ListView.builder(
                  shrinkWrap: true,
                  itemCount: matchingRecords.length,
                  itemBuilder: (context, index) {
                    StudentAbsent record = matchingRecords[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppConstants().formatDate(record.time.toString())),
                        Text(record.reason),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }




}