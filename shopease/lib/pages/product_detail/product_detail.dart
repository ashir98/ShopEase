import 'package:flutter/material.dart';
<<<<<<< HEAD

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
>>>>>>> e9eda6b663a9e4ab453d44769664202dcc34838a

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: Text("Categories"),
      ),



      body: Column(
        children: [
          
=======

      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          // -- PICTURE
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: Card(
              color: AppColors.imgBgColor,
              child: Image.network("https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1697019228/Croma%20Assets/Communication/Mobiles/Images/300665_0_ebmyeq.png"),
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
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



                    // -- RATING
                    


                    // -- COLOR


                    // -- DESCRIPTION
                  ],
                ),
              ],
            ),
          )


          


>>>>>>> e9eda6b663a9e4ab453d44769664202dcc34838a
        ],
      ),


    );
  }
<<<<<<< HEAD
}
=======
}


>>>>>>> e9eda6b663a9e4ab453d44769664202dcc34838a
