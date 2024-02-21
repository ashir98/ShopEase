import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(5.0).r,
                child: Card(
                  elevation: 0,
                  color: Color(0xfff3f3f3),
                  child: Image.network("https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1697019228/Croma%20Assets/Communication/Mobiles/Images/300665_0_ebmyeq.png"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text("Iphone 15 Pro", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$1000", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
                        Row(
                          children: [
                            Icon(Icons.star_rounded, color: AppColors.secondaryColor, size: 18.sp,),
                            Text("4.5", style: TextStyle(fontSize: 14.sp),)
                          ],
                        )
                      ],
                    )
                
                  ],
                ),
              ),
            )
          ],
        ),
      )
      );
  }
}