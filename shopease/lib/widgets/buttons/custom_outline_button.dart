import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/utils/helper_functions.dart';

class CustomOutlineButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool isLoading;

  CustomOutlineButton({
    required this.title,
    required this.onTap,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              height: 40.h ,
              child: OutlinedButton(
                onPressed: onTap,

                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.primaryColor
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: AppColors.primaryColor
                    )
                  )
                ),
      
                child: isLoading?  SizedBox( width: 25.w, height: 25.h ,child: CircularProgressIndicator(color: Colors.white, ))  : Text(title  ,style: TextStyle(color: AppColors.primaryColor,fontSize: 15.sp),),
              ),
            );
  }
}