
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryButton extends StatelessWidget {
  String name;
  String icon;
  VoidCallback onTap;

  CategoryButton({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
         Expanded(
           child: SizedBox(
             height: 60.h,
             width: 60.w,
             child: Card(
               elevation: 0,
               color: AppColors.primaryColor.withOpacity(0.2),
               child: Center(
                 child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: icon, width: 30.w, height: 30.h,)
               ),
             ),
           ),
         ),
      
         Text(name, style: TextStyle(color: AppColors.primaryColor, fontSize: 11.sp, fontWeight: FontWeight.w600),)
      
      
        ],
      ),
    );
  }
}

