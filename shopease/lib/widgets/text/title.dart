import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  String text;
  TitleText({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
                  text,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                );
  }
}