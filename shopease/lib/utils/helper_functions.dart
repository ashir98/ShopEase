import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';






  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


  gotoPage(Widget page ,BuildContext context){
    Navigator.push(context, PageTransition(child: page, type: PageTransitionType.fade));
  }


  removeAndGotoPage( Widget page,BuildContext context){
     Navigator.pushReplacement(context, PageTransition(child: page, type: PageTransitionType.fade));
  }


  removeAllAndGotoPage( Widget page ,BuildContext context){
    Navigator.pushAndRemoveUntil(context, PageTransition(child: page, type: PageTransitionType.fade), (route)=>false);
  }




  displayMessage(String message, BuildContext context ){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }











