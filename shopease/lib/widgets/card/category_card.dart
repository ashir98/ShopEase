
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:shopease/widgets/text/title.dart';

class CategoryCard extends StatelessWidget {

  String imgUrl;
  String title;
  String subtitle;
  VoidCallback onTap;

  CategoryCard({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      child: Card(
        elevation: 0,
        surfaceTintColor: Colors.white,
        color: Color(0xfff3f3f3),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5).r,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              // -- EXPANDED
              Expanded(
                child: Image.asset(
                  AppImages.welcome
                ),
              ),
                  
                  
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText(text: title),
                    SubtitleText(text: subtitle, fontSize: 14.sp)
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}