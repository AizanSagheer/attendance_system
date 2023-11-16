import 'package:flutter/material.dart';

import '../Components/SignInComponent/sign_in_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInComponent(),
    );
  }
}

