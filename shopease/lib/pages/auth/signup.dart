import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/firebase/auth_service.dart';
import 'package:shopease/pages/auth/login.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/buttons/custom_button.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:shopease/widgets/text/heading.dart';
import 'package:shopease/widgets/textfield/custom_pw_field.dart';
import 'package:shopease/widgets/textfield/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});


  TextEditingController firstNameContoller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneContoller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordContoller = TextEditingController();


  AuthService _authService = AuthService();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // -- APP LOGO
                Image.asset(
                  AppImages.appLogo,
                  width: getScreenWidth(context) *0.25,
                ),
            
                SizedBox(
                  height: getScreenHeight(context) *0.02,
                ),
            
            
                // -- HEADING
                // TitleText(text: "Create an account"),
            
                SizedBox(
                  height: getScreenHeight(context) *0.002,
                ),
                
                
            
                // -- DESCRIPTION
                SubtitleText(text: "Sign up now to get started with you account", fontSize: 15.sp,),
            
                SizedBox(
                  height: getScreenHeight(context) *0.04,
                ),
            
            
                // -- FORM
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // -- EMAIL FIELD,
                      CustomTextField(
                        controller: firstNameContoller,
                        hintText: "First name",
                        prefixIcon: FluentIcons.person_16_regular,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                        },
                      ),
            
                      SizedBox(
                        height: getScreenHeight(context) * 0.02,
                      ),

                      CustomTextField(
                        controller: lastNameController,
                        hintText: "Last name",
                        prefixIcon: FluentIcons.person_16_regular,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                        },
                      ),
            
                      SizedBox(
                        height: getScreenHeight(context) * 0.02,
                      ),

                      CustomTextField(
                        controller: emailController,
                        hintText: "Email",
                        prefixIcon: FluentIcons.mail_16_regular,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }else if(!value.contains("@")  || !value.contains(".com")  ){
                            return "Enter a valid email address";

                          }
                        },
                      ),
            
                      SizedBox(
                        height: getScreenHeight(context) * 0.02,
                      ),

                      CustomTextField(
                        controller: phoneContoller,
                        hintText: "Phone number",
                        prefixIcon: FluentIcons.phone_16_regular,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone number";
                          }
                        },
                      ),
            
                      SizedBox(
                        height: getScreenHeight(context) * 0.02,
                      ),

            
            
            
                      // -- PASSWORD FIELD
                      Consumer<AppChangeNotifier>(
                        
                        builder:(context, value, child) =>   CustomPasswordField(
                          controller: passwordController,
                          hintText: "Password",
                          prefixIcon: FluentIcons.lock_closed_16_regular,
                          obscureText: value.obscureText,
                          passwordToggle: value.passwordToggle,
                          validator: (value) {
                            if (value!.isEmpty) {
                            return "Please enter your Password";
                          }else if(value.length < 6 ){
                            return "Password should be atleast 6 character long";

                          }
                            
                          },
                        ),
                      ),

                      SizedBox(
                        height: getScreenHeight(context) * 0.02,
                      ),

                      Consumer<AppChangeNotifier>(
                        builder:(context, value, child) =>   CustomPasswordField(
                          controller: confirmPasswordContoller,
                          hintText: "Confirm Password",
                          prefixIcon: FluentIcons.lock_closed_16_regular,
                          obscureText: value.obscureText,
                          passwordToggle: value.passwordToggle,
                          validator: (value) {
                            if (value != passwordController.text) {
                            return "Password does not match";
                          }
                          },
                        ),
                      ),
            
            
            
                    ],
                  ),
                ),
            
            
                
            
                SizedBox(
                  height: getScreenHeight(context) *0.02,
                ),
            
            
                // -- SIGN IN BUTTON
            
                Consumer<AppChangeNotifier>(
                  builder:(context, value, child) =>  CustomButton(
                    title: "Create account",
                    isLoading: value.isLoading,
                    onTap: () {
                    if (_formKey.currentState!.validate()) {
                      value.setLoading(true); 

                      _authService
                      .signup(
                        firstNameContoller.text,
                        lastNameController.text,
                        phoneContoller.text,
                        emailController.text,
                        passwordController.text,
                        context,
                      )
                      .then((value) {
                        value.setLoading(false);
                        gotoPage( LoginPage(), context);
                        

                      }).catchError((error) {
                        
                        value.setLoading(false); 
                      });
                    } else {

                      value.setLoading(false);
                    }
                  },

                  ),
                ),
            
            
               
            
              ],
            ),
          ),
        ),
      )
    );
  }
}