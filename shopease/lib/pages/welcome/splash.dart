import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/firebase/auth_service/auth_state.dart';
import 'package:shopease/pages/welcome/welcome.dart';
import 'package:shopease/utils/helper_functions.dart';

class SplashScreen extends StatefulWidget {

  Widget page;

  SplashScreen({super.key, required this.page});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
void initState() {
  super.initState();
  Timer(Duration(seconds: 3), () {
    if (mounted) {
      removeAndGotoPage(widget.page, context);
    }
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        
            // -- APP LOGO
            Image.asset(
              AppImages.appLogo,
              width: 150.w,
              height: 150.h,
            ),
        
        
        
            // -- LOADING INDICATOR
            CircularProgressIndicator(
              color: AppColors.primaryColor,
              
            )
          ],
        ),
      ),
    );
  }
}