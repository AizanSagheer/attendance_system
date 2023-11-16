import 'package:flutter/material.dart';

import 'package:attendance/Components/HomeScreenComponent/students_list_widget.dart';
import 'package:attendance/Utils/color_constants.dart';
import '../../Screens/absent_management_screen.dart';
import '../../Screens/attendance_summary_screen.dart';
import '../Widgets/custom_text_field.dart';
import 'home_card.dart';

class HomeScreenComponent extends StatelessWidget {
  const HomeScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02)
            .copyWith(top: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(
              hintTexts: 'Search here',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children:  [
                  Expanded(
                      child: HomeCard(
                          cardTitle: 'Absent Management',
                          cardColor: ColorConstants.secondaryColor,
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AbsentManagementScreen()),
                          );

                        },
                      )),
                const  SizedBox(width: 4),
                  Expanded(
                      child: HomeCard(
                          cardTitle: 'Summary',
                          cardColor: ColorConstants.orangeColor,
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AttendanceSummaryScreen()),
                          );

                        },
                      )),
                ],
              ),
            ),
            const Text(
              'All Students',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const Expanded(child: StudentsListWidget()),
          ],
        ),
      ),
    );
  }
}