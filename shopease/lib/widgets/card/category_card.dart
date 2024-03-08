
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:shopease/widgets/text/title.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryCard extends StatelessWidget {

  String imageUrl;
  String name;
  String description;
  VoidCallback onTap;

  CategoryCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage, 
                    image: imageUrl
                  )
                ),
                    
                    
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleText(text: name),
                      SubtitleText(text: description, fontSize: 14.sp)
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}