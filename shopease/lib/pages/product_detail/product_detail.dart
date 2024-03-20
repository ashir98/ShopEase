import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/models/product_model.dart';
import 'package:shopease/provider/cart_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/card/cart_card.dart';
import 'package:shopease/widgets/cart/cart_checkout.dart';
import 'package:shopease/widgets/text/heading.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel product;

  ProductDetailPage(
      {super.key,
      required this.product
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
              tag: product.id,
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
                        image: product.imageUrl,
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
                          product.name,
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
        
                      // quantity
                      QuantityCounter(
                        qty: 1, 
                        increment: (){}, 
                        decrement: (){}
                      )
                    ],
                  ),
        
                  // -- RATING
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.star_24_filled, color: AppColors.secondaryColor,),
                      Text(
                        product.rating.toString(),
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
                  SubtitleText(text: product.description, fontSize: 14.sp)
                ],
              ),
            )
          ],
        ),
      ),




      bottomNavigationBar: Consumer<CartNotifier>(
        builder: (context, value, child) =>  AddToCartBar(
          totalPrice: product.price, 
          onTap: () {
            print("object");
            value.addToCart(product);
            displayMessage("Product added to your cart", context);
          },
        ),
      ),







    );

  }
}