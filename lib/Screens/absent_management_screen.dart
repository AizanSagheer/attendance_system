import 'package:flutter/material.dart';

import '../Components/AbsentManagementComponents/absent_management_components.dart';

class AbsentManagementScreen extends StatelessWidget {
  const AbsentManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AbsentManagementComponents(),
    );
  }
}
