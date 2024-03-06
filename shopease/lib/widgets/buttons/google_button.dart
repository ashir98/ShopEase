import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/lottie.dart';
import 'package:shopease/utils/helper_functions.dart';

class GoogleButton extends StatelessWidget {
  VoidCallback onTap;
  bool isLoading;

  GoogleButton({
    required this.onTap,
    this.isLoading = true
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child:
         isLoading?

         
         Lottie.asset(AppLottie.gLoading,height: 150,width: 300)
         
         
         :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppImages.google),
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Sign in with Google")
          ],
        ),
      ),
    );
  }
}
