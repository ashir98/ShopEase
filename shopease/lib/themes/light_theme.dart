import 'package:flutter/material.dart';
import 'package:shopease/constants/colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(

  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),


  inputDecorationTheme: InputDecorationTheme(




        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8), // Adjust the value as needed
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        hintStyle: TextStyle(color: Colors.grey.shade400)

  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor
  )




);