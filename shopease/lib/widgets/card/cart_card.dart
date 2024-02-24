

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Card(
        elevation: 0.2,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Row(
          children: [
      
            Expanded(
              flex: 2,
              child: SizedBox(
                height: double.infinity,
                child: Card(
                  elevation: 0,
                  color: AppColors.imgBgColor,
                  child: Image.network(
                    "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1697019228/Croma%20Assets/Communication/Mobiles/Images/300665_0_ebmyeq.png"
                  ),
                ),
              ),
            ),
      
      
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(child: Text("Iphone 15 pro max", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp), overflow: TextOverflow.ellipsis,)),
                        IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(FluentIcons.delete_16_regular, size: 20.sp,),
                        )
                      ],
                    ),
                
                    Text("Color: Black",style: TextStyle(fontSize: 14.sp),),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                
                        Text("\$100", style: TextStyle(color: AppColors.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.w600),),
                        Row(
                          children: [
                
                            IconButton(
                              onPressed: () {
                                
                              },
                              color: AppColors.primaryColor,
                              
                              icon: Icon(Icons.remove, size: 18.sp,),
                            ),
                            Text("1", style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),),
                
                            IconButton(
                              onPressed: () {
                                
                              },
                              color: AppColors.primaryColor,
                              icon: Icon(Icons.add, size: 18.sp,),
                            ),
                
                
                          ],
                        )
                
                      ],
                    )
                    
                  ],
                ),
              ),
            )
      
      
      
      
          ],
        )
      ),
    );
  }
}