import 'package:flutter/material.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/utils/helper_functions.dart';

class SubtitleText extends StatelessWidget {

  String text;
  double fontSize;
  SubtitleText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.subtitleTextColor
      ),
    );
  }
}