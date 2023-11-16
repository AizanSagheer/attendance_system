import 'package:flutter/material.dart';

import '../Components/AttendanceSummaryComponents/attendance_summary_components.dart';

class AttendanceSummaryScreen extends StatelessWidget {
  const AttendanceSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AttendanceSummaryComponents(),
    );
  }
}
