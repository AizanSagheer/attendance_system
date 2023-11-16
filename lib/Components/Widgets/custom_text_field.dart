import 'package:flutter/material.dart';

import '../../Utils/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintTexts, this.prefixWidget, this.suffixWidget, this.controller, this.validator, this.inputAction, this.isObscureText = false, this.onFieldSubmit,this.inputType,this.onChange});
  final String? hintTexts;
  final  Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final Function(String?)? onChange;
  final TextInputAction? inputAction;
  final Function(String?)? onFieldSubmit;
  final bool isObscureText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      enableSuggestions: false,
      autocorrect: false,
      controller: controller,
      validator: validator,
      textInputAction:inputAction,
      onFieldSubmitted: onFieldSubmit,
      obscureText: isObscureText,
      autofocus: false,
      onChanged: onChange,
      keyboardType: inputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide:  const BorderSide(width: 2, color: ColorConstants.grayColor),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintTexts,
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: ColorConstants.grayColor),
            borderRadius: BorderRadius.circular(12),
          ),
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorConstants.grayColor)
      ),
    );
  }
}