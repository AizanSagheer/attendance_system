import 'package:flutter/material.dart';

import '../Components/HomeScreenComponent/home_screen_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  const Scaffold(
      body: HomeScreenComponent(),
    );
  }
}
