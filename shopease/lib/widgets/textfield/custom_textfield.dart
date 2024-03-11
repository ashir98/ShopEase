import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  
  TextEditingController? controller;
  String? hintText;
  IconData? prefixIcon;
  TextInputType? keyboardType;
  GlobalKey<FormState>? formkey;
  String? Function(String? value)? validator;
  




  CustomTextField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.formkey,
    this.validator,
    this.keyboardType = TextInputType.text

  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15).r,
          hintText: hintText,
          prefixIcon: Icon( prefixIcon, color: Colors.grey.shade500,  )
      ),

      validator:  validator,

      






    );
  }
}
