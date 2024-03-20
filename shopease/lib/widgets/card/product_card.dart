

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/models/product_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  ProductModel product;

  VoidCallback? onTap;
  bool isFav;
  VoidCallback? addToFav;



  ProductCard({
    super.key,
    required this.product,
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
                  tag: product.id,
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
                                image: product.imageUrl,
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
                          product.name,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs.${product.price}",
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
                              product.rating.toString(),
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