import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/widgets/text/heading.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailPage extends StatelessWidget {

  String id;
  String name;
  String imageUrl;
  String description;



  ProductDetailPage({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),

      body: Column(
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
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: imageUrl)
              ),
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
                      child: Text("Iphone 15 pro max", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis,),
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
                          style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
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
                    


                // -- COLOR


                // -- DESCRIPTION
                HeadingText(text: "Description", fontSize: 18.sp),



              ],
            ),
          )


          


        ],
      ),


    );
  }
}


