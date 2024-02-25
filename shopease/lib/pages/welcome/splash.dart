import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/firebase/auth_state.dart';
import 'package:shopease/pages/welcome/welcome.dart';
import 'package:shopease/utils/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () { removeAndGotoPage( AuthState() , context); });
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