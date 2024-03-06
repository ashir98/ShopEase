import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/firebase/auth_service/auth_service.dart';
import 'package:shopease/pages/navigation.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/buttons/custom_button.dart';
import 'package:shopease/widgets/buttons/social_button.dart';
import 'package:shopease/widgets/text/subtitle.dart';
import 'package:shopease/widgets/text/heading.dart';
import 'package:shopease/widgets/textfield/custom_pw_field.dart';
import 'package:shopease/widgets/textfield/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});



  // -- CONTROLLERS
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  // -- FORM KEY
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // -- AUTH SERVICE INSTANCE
  AuthService _authService = AuthService();



  @override
  Widget build(BuildContext context) {
     emailContoller.text  = "ashir07aptech@gmail.com";
     passwordController.text ="00000000";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // -- APP LOGO
                Image.asset(
                  AppImages.appLogo,
                  width: 100.w,
                  height: 100.h,
                ),
            
                SizedBox(
                  height: getScreenHeight(context) *0.02,
                ),
            
            
                // -- HEADING
                HeadingText(text: "Login to your account", fontSize:25.sp ,),
            
                SizedBox(
                  height: getScreenHeight(context) *0.002,
                ),
                
                
            
                // -- DESCRIPTION
                SubtitleText(text: "Welcome back, please enter your details", fontSize: 15.sp,),
            
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
                        controller: emailContoller,
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
                      )
            
            
            
                    ],
                  ),
                ),
            
            
                // -- FORGOT PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    
                    onPressed: () {
                      
                    }, 
                    child: Text("Forgot password?")
                  ),
                ),
            
                SizedBox(
                  height: getScreenHeight(context) *0.02,
                ),
            
            
                // -- SIGN IN BUTTON
            
                Consumer<AppChangeNotifier>(
                  builder:(context, provalue, child) =>  CustomButton(
                    title: "Sign in",
                    isLoading: provalue.isLoading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        provalue.setLoading(true);
                        _authService
                        .signIn(emailContoller.text, passwordController.text, context)
                        .then((value){
                          provalue.setLoading(false);
                        })
                        .catchError((error){
                          provalue.setLoading(false);
                        });
                        
                      }
                      // gotoPage(ScreenNavigation(), context);
                    },
                  ),
                ),
            
            
                SizedBox(
                  height: getScreenHeight(context) *0.04,
                ),
            
            
            
                // -- OR CONTINUE WITH TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Divider(color: Colors.grey, indent: 60, endIndent: 5)),
                    Text("Or continue with", style: TextStyle(color: Colors.grey),),
                    Flexible(child: Divider(color: Colors.grey, indent: 5, endIndent: 60)),
                  ],
                ),
            
                SizedBox(height: getScreenHeight(context) *0.03,),
                
                
            
                // -- GOOGLE BUTTON
                GoogleButton(
                  onTap: () {
                    _authService
                    .googleSignIn(context);
                   
                
                                   
                    
                  },
                ),
                SizedBox(
                  height: getScreenHeight(context) *0.04,
                ),
            
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account?", style: TextStyle(color: Colors.grey),),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text("Sign up"),
                    )
                  ],
                )
            
              ],
            ),
          ),
        ),
      )
    );
  }
}