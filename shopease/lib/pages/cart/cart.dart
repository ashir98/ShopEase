import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/widgets/card/cart_card.dart';
import 'package:shopease/widgets/cart/cart_checkout.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),


      body: Column(
        children: [
          Padding(
            padding: defaultPadding,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartItemWidget();
              },
            ),
          ),


          CartCheckOutButton()
        ],
      ),
    );
  }
}