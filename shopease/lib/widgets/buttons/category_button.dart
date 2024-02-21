
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/utils/helper_functions.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Expanded(
         child: SizedBox(
           height: 60.h,
           width: 60.w,
           child: Card(
             elevation: 0,
             color: AppColors.primaryColor.withOpacity(0.2),
             child: Center(
               child: Icon(FluentIcons.phone_24_filled, color: AppColors.primaryColor, size: 35.sp,),
             ),
           ),
         ),
       ),
    
       Text("SmartPhone", style: TextStyle(color: AppColors.primaryColor, fontSize: 11.sp, fontWeight: FontWeight.w600),)
    
    
      ],
    );
  }
}

