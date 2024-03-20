import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/widgets/buttons/custom_button.dart';

class AddToCartBar extends StatelessWidget {

  VoidCallback onTap;
  int totalPrice;



  AddToCartBar({super.key, required this.totalPrice, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: Colors.black,
      child: Container(
        
        height: 70.h,
        width: double.infinity,
        child: Padding(
          padding: defaultPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
              // -- TOTAL PRICE
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Price", style: TextStyle(color: Colors.grey),),
                    Text("\$32000", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
          
              
          
              // -- CHECKOUT BUTTON
              Expanded(
                flex: 2,
                child: CustomButton(
                  onTap:onTap,
                  title: "Add to cart",
          
                ),
              )
          
            ],
          ),
        ),
      
      ),
    );
  }
}