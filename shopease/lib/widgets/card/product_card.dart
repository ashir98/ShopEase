import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';

class ProductCard extends StatelessWidget {
  String title;
  String imgUrl;
  double price;
  double? rating;
  VoidCallback? onTap;

  ProductCard({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.price,
    this.rating = 1.1,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
                  child: Image.network(imgUrl),
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
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price.toString(),
                          style: TextStyle(
                              fontSize: 18.sp, color: AppColors.primaryColor),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: AppColors.secondaryColor,
                              size: 18.sp,
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
