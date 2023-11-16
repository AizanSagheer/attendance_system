import 'package:attendance/Providers/student_provider.dart';
import 'package:flutter/material.dart';

import 'package:attendance/Components/HomeScreenComponent/students_list_widget.dart';
import 'package:attendance/Utils/color_constants.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import '../../Screens/absent_management_screen.dart';
import '../../Screens/attendance_summary_screen.dart';
import '../ChangeLocalesComponents/change_locales_components.dart';
import '../Widgets/custom_text_field.dart';
import 'home_card.dart';

class HomeScreenComponent extends StatelessWidget {
  HomeScreenComponent({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Consumer<StudentProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02)
                .copyWith(top: height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                          hintTexts: 'Search here',
                          prefixWidget:const Icon(Icons.search),
                          controller: searchController,
                          inputAction: TextInputAction.search,
                          onFieldSubmit: (String? value) async {
                            if (value!.isNotEmpty) {
                              provider.searchStudents(searchController.text);
                              debugPrint(searchController.text);
                            }
                          }),
                    ),
                    IconButton(onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const ChangeLocalesComponents()),
                      );

                    }, icon: const Icon(Icons.language_outlined)),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: HomeCard(
                            cardTitle: 'absent',
                            cardColor: ColorConstants.secondaryColor,
                            onTap: () {

                              provider.fetchDataBaseItems();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const AbsentManagementScreen()),
                              );
                            },
                          )),
                      const SizedBox(width: 4),
                      Expanded(
                          child: HomeCard(
                            cardTitle: 'summary',
                            cardColor: ColorConstants.orangeColor,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const AttendanceSummaryScreen()),
                              );
                            },
                          )),
                    ],
                  ),
                ),
                 const LocaleText(
                  'all',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const Expanded(child: StudentsListWidget()),
              ],
            ),
          ),
        );
      },
    );
  }
}
