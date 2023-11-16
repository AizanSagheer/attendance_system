import 'package:flutter/material.dart';

import '../../Utils/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        required this.backgroundColor,
        required this.borderColor,
        required this.isIcon,
        required this.text,
        required this.onTap,
      })
      : super(key: key);

  final Color backgroundColor;
  final Color borderColor;
  final bool isIcon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return InkWell(
      onTap: onTap,
      hoverColor: ColorConstants.transparentColor,
      splashColor: ColorConstants.transparentColor,
      focusColor: ColorConstants.transparentColor,
      highlightColor: ColorConstants.transparentColor,

      child: Container(
        height:height * 0.073,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SizedBox(
              child: Text(text,
                  style: TextStyle(
                      color: backgroundColor == ColorConstants.transparentColor
                          ? ColorConstants.secondaryColor
                          : ColorConstants.primaryColor,
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.normal
                  )),
            ),
            isIcon
                ? const Icon(
              Icons.arrow_forward_ios,
              color: ColorConstants.primaryColor,
              size: 15,
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
