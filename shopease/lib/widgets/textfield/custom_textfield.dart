import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  
  TextEditingController? controller;
  String? hintText;
  IconData? prefixIcon;
  String? Function(String? value)? validator;
  




  CustomTextField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.validator

  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15).r,
          hintText: hintText,
          prefixIcon: Icon( prefixIcon  )
      ),

      validator:  validator,
    );
  }
}