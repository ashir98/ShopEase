import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopease/constants/colors.dart';






  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


  gotoPage(Widget page ,BuildContext context,{PageTransitionType transition = PageTransitionType.fade}){
    Navigator.push(context, PageTransition(child: page, type: transition));
  }


  removeAndGotoPage( Widget page,BuildContext context){
     Navigator.pushReplacement(context, PageTransition(child: page, type: PageTransitionType.fade));
  }


  removeAllAndGotoPage( Widget page ,BuildContext context){
    Navigator.pushAndRemoveUntil(context, PageTransition(child: page, type: PageTransitionType.fade), (route)=>false);
  }




  displayMessage(String message, BuildContext context ){

    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(message, style: TextStyle(color: AppColors.primaryColor),),
        backgroundColor: Colors.white,

      )
    );
  }




  showAlertDialouge( BuildContext context, {required String title, required content,required VoidCallback? onConfirm, } ){
    showDialog(
                        context: context, 
                        builder: (context) {
                          return AlertDialog(
                            title: Text(title),
                            content: Text(content),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: onConfirm,
                                child: Text('Yes'),
                              )
                            ],
                          );
                        },
                      );
  }




















