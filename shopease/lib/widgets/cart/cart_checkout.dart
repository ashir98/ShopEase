import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/widgets/buttons/custom_button.dart';

class AddToCartBar extends StatelessWidget {

  VoidCallback onTap;
  int totalPrice;



  AddToCartBar({super.key, required this.totalPrice, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      child: Row(
        children: [

          // -- TOTAL PRICE
          Expanded(
            child: Column(
              children: [
                Text("Total Price"),
                Text("\$32000")
              ],
            ),
          ),

          

          // -- CHECKOUT BUTTON
          Expanded(
            child: CustomButton(
              onTap: () {
                
              },
              title: "Checkout",

            ),
          )

        ],
      ),

    );
  }
}