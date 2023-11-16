import 'package:flutter/material.dart';

import 'absent_list_widget.dart';

class AbsentManagementComponents extends StatelessWidget {
  const AbsentManagementComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    return SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: const [
           AbsentListWidget(index: 0),
           AbsentListWidget(index: 1),
           AbsentListWidget(index: 2),
          ],
        ),
      ),
    );
  }
}



