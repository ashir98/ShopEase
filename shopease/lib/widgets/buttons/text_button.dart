import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {

  String text;
  VoidCallback onTap;



  CustomTextButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
                  onPressed: onTap,
                  child: Text( text  ,style: TextStyle(fontSize: 14.sp),),
                );
  }
}