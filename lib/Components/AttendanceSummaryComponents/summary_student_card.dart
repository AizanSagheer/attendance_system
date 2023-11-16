import 'package:flutter/material.dart';

class SummaryStudentCard extends StatelessWidget {
  const SummaryStudentCard({
    Key? key, required this.index, required this.studentName, this.isAbsentSection = false, this.reason = ''
  }) : super(key: key);

  final int index;
  final String studentName;
  final String reason;
  final bool isAbsentSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(index.toString()),
        Spacer(),
        Text(studentName),
        Spacer(),
        isAbsentSection
            ?Text(reason)
            :const SizedBox()
      ],
    );
  }
}
