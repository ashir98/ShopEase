

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  String id;
  String name;
  String imageUrl;
  double price;
  double? rating;
  VoidCallback? onTap;
  bool isFav;
  VoidCallback? addToFav;



  ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.rating = 1.1,
    this.onTap,
    required this.isFav,
    this.addToFav
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(top:5.0,  left: 5,  right: 5).r,
                child: Hero(
                  tag: id,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: Card(
                          elevation: 0,
                          color: Color(0xfff3f3f3),
                          child: Padding(
                            padding: const EdgeInsets.all(20).r,
                            child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: imageUrl,
                                fadeInDuration: const Duration(milliseconds: 300),
                              ),
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: addToFav,
                        icon: Icon(
                          isFav? FluentIcons.heart_16_filled: FluentIcons.heart_16_regular, 
                          color: AppColors.secondaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs.$price",
                          style: TextStyle( fontSize: 16.sp, fontWeight: FontWeight.w400,color: AppColors.primaryColor),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: AppColors.secondaryColor,
                              size: 16.sp,
                            ),
                            Text(
                              rating.toString(),
                              style: TextStyle(fontSize: 14.sp),
                            )
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
      )),
    );
  }
}
