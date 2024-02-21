import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/utils/helper_functions.dart';

class SocialButton extends StatelessWidget {
  String socialIcon;
  VoidCallback onTap;

  SocialButton({
    required this.onTap,
    required this.socialIcon
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(50)
        )
      ),
      icon: Image(
        image: AssetImage(socialIcon),
        width: 30.w,
        height: 30.h,

      ),
    );
  }
}