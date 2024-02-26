import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/widgets/text/heading.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailPage extends StatelessWidget {
  String id;
  String name;
  String imageUrl;
  double rating;
  String description;

  ProductDetailPage(
      {super.key,
      required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.rating
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- PICTURE
            Hero(
              tag: id,
              child: SizedBox(
                height: 250.h,
                width: double.infinity,
                child: Card(
                    elevation: 0,
                    color: Color(0xfff3f3f3),
                    child: Padding(
                      padding: const EdgeInsets.all(15).r,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: imageUrl,
                      ),
                    )),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- PRODUCT TITLE AND QUANTITY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // title
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
        
                      // quantity
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            color: AppColors.primaryColor,
                            icon: Icon(
                              Icons.remove,
                              size: 18.sp,
                            ),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 16.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            color: AppColors.primaryColor,
                            icon: Icon(
                              Icons.add,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
        
                  // -- RATING
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.star_24_filled, color: AppColors.secondaryColor,),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
        
                  // -- COLOR
        
                  // -- DESCRIPTION
                  HeadingText(text: "Description", fontSize: 18.sp),
                  SubtitleText(text: description, fontSize: 14.sp)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
