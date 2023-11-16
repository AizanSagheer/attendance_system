import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../Utils/color_constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.cardTitle,
    required this.cardColor,
    required this.onTap,
  }) : super(key: key);

  final String cardTitle;
  final Color cardColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.18,
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        alignment: Alignment.center,
        child: LocaleText(cardTitle, style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
