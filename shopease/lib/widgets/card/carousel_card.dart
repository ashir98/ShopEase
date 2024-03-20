import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:transparent_image/transparent_image.dart';

class CarouselCard extends StatelessWidget {

  String image;
  VoidCallback onTap;
  


  CarouselCard({
    super.key,
    required this.image,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(AppImages.carouselBg),
            fit: BoxFit.fill
          )
        ),
        child: Padding(
          padding: defaultPadding,
          child: Row(
            children: [
          
              Expanded(
                flex: 2,
                child: FadeInImage.memoryNetwork(
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Text("Error loading image");
                  },
                  placeholder: kTransparentImage, 
                  image: image
                ),
              ),

              15.horizontalSpace,
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Special deal for 2024",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 2,
                    ),
          
          
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: Text("Shop now", style: TextStyle(fontSize: 12.sp),),
                    )
          
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