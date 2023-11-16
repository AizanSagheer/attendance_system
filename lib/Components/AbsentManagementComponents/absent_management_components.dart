import 'package:attendance/Providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'absent_list_widget.dart';

class AbsentManagementComponents extends StatelessWidget {
  const AbsentManagementComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double width = size.width;

    return Consumer<StudentProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: provider.students.length,
                      itemBuilder: (context, index) {
                        return AbsentListWidget(index: index);
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



