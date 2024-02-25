import 'package:flutter/material.dart';
import 'package:shopease/constants/colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(

  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),


  inputDecorationTheme: InputDecorationTheme(




        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
          borderSide: BorderSide(color: AppColors.primaryColor, width: 0.7)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
          borderSide: BorderSide(color: AppColors.primaryColor, width: 0.7) 
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
          borderSide: BorderSide(color: Colors.red, width: 0.7) 
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
          borderSide: BorderSide(color: Colors.red, width: 0.7) 
        ),


        contentPadding: EdgeInsets.symmetric(vertical: 5),
        hintStyle: TextStyle(color: Colors.grey.shade400)

  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor
  )




);