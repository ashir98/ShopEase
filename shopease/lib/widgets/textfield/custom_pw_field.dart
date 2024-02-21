import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordField extends StatelessWidget {
  
  TextEditingController? controller;
  String? hintText;
  IconData? prefixIcon;
  bool obscureText;
  String? Function(String? value)? validator;
  VoidCallback?passwordToggle;
  




  CustomPasswordField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.obscureText = true,
    this.passwordToggle


  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
        
          contentPadding: EdgeInsets.symmetric(vertical: 15).r,
          hintText: hintText,
          prefixIcon: Icon( prefixIcon ),
          suffixIcon: IconButton(
            onPressed: passwordToggle,
            icon: Icon(  obscureText?   FluentIcons.eye_16_regular  :   FluentIcons.eye_off_16_regular),
          )
      ),

      validator:  validator,
    );
  }
}
