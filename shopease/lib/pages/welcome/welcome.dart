import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/pages/auth/login.dart';
import 'package:shopease/pages/auth/signup.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/buttons/custom_button.dart';
import 'package:shopease/widgets/buttons/custom_outline_button.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:shopease/widgets/text/heading.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: defaultPadding, 
        child: Column(
          children: [
      
            // -- ILLUSTRATION
            Image.asset(
              AppImages.welcome,
              width: 250.w,
              height: 250.h,
            ),
      
      
      
      
            // -- HEADING
            HeadingText(text: "Welcome to ShopEase", fontSize: 25.sp),
      
      
      
            // -- DESCRIPTION
            SubtitleText(
              text: "The place you are seeking for all your stuff",
              fontSize: 15.sp,
            ),



            Spacer(),
      
      
            // -- BUTTON for get stareted
            CustomButton(
              title: "Get started",
              onTap: () {



                gotoPage(SignUpPage(), context);
              },
            ),


            SizedBox(height: 10,),



            // already have an account button
            CustomOutlineButton(
              onTap: () {
                gotoPage(LoginPage(), context);
              },
              title: "Already have an account",
            )



      
      
      
      
      
      
          ],
        ),
      )
    );
  }
}