import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/utils/helper_functions.dart';

class CustomButton extends StatelessWidget {

  String title;
  VoidCallback onTap;
  bool isLoading;


  CustomButton({
    required this.title,
    required this.onTap,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              height: 40.h ,

              child: ElevatedButton(
                onPressed: onTap,

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
      
                child: isLoading?  SizedBox( width: 25.w, height: 25.h ,child: CircularProgressIndicator(color: Colors.white, ))  : Text(title  ,style: TextStyle(color: Colors.white, fontSize: 15.sp),),
              ),
            );
  }
}