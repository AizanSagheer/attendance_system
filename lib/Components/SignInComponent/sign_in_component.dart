import 'package:attendance/Screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../Utils/color_constants.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';

class SignInComponent extends StatelessWidget {
  SignInComponent({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final  formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter valid email address';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double fontMultiplier = width * 0.07;

    return SafeArea(
      child: SizedBox(
        height: height,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04,),
                Text('Login',
                    style: TextStyle(fontSize: fontMultiplier * 1.0)),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0)
                        .copyWith(bottom: 10),
                    child: const Text('Please enter your email')
                ),
                SizedBox(height: height * 0.03,),
                CustomTextField(
                    hintTexts: 'Enter email address',
                    controller: emailController,
                    validator: (value) => value!.isEmpty ? 'Enter Email' : validateEmail(value)
                ),
                SizedBox(height: height * 0.02,),
                CustomButton(
                  backgroundColor: ColorConstants.secondaryColor,
                  borderColor: ColorConstants.transparentColor,
                  isIcon: true,
                  text: 'Next',
                  onTap: () {
                    if (formKey.currentState!.validate()) {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );

                    }
                  },
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
