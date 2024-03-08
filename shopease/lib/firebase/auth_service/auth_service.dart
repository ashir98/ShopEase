
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopease/main.dart';
import 'package:shopease/pages/navigation.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:google_sign_in/google_sign_in.dart';






















class AuthService{


  // -- FIRBBASE  INSTANCES
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _google = GoogleSignIn();
  FirebaseFirestore _db = FirebaseFirestore.instance;



  Future googleSignIn(BuildContext context)async{ 



    // TRIGGER THE GOOGLE AUTH FLOW
    GoogleSignInAccount? googleAccount = await _google.signIn();

    if (googleAccount != null) {

      
    // -- OBTAIN THE GOOGLE AUTH DETAILS
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

    // -- CREATE A CREDENTIAL
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);
    User user = userCredential.user!;


     DocumentSnapshot userDoc = await _db.collection('users').doc(user!.uid).get();


     if(!userDoc.exists){
      var user = userCredential.user;

      var userData ={
        'id': user!.uid,
        'email': user.email,
        'name':user.displayName,
        'phone' :user.phoneNumber,
        'favourite' : []
      };

      await  _db
      .collection('users')
      .doc(user.uid)
      .set(userData);

     }

     displayMessage( "Logged in as ${user.email}" ,  context);

     removeAllAndGotoPage(ScreenNavigation(), context);



      
   }







  }








  // -- USER SIGN UP
  Future signup(String firstName, lastName, phone,email, password,  BuildContext context)async{
   try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = credential.user!;
      

      // Create a new document in Firestore for the user
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'verificationStatus': false, // Initially set to false
        'favourites' : []
      });

      // Send email verification
      await user.sendEmailVerification().then((value) {
        displayMessage("A verification email has been sent to your email", context);
      });


      _auth.signOut();
      

    } catch (error) {
      displayMessage(error.toString(), context);
    }


  }




  // -- USER SIGN IN
  Future signIn(String email, password, BuildContext context )async{
   try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;

      // Check if email is verified
      if (user.emailVerified) {
        removeAllAndGotoPage(ScreenNavigation() , context);

        displayMessage("Logged in as "+user.email.toString(), context);

        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'verificationStatus': true, // Initially set to false
      });



      } else {
        displayMessage("Email not verified", context);
      }
    } catch (error) {
      displayMessage(error.toString(), context);
    }

  }











  // -- SIGN OUT
   Future signout(BuildContext context)async{
    await _google.signOut();
    await _auth
    .signOut()
    .then((value){

      removeAllAndGotoPage(ShopEase(), context);


    });
  }

}

// .then((value){
//       _db
//       .collection('users')
//       .doc(_auth.currentUser!.uid)
//       .set({
//         'isVerified' : true
//       });
//       displayMessage("Logged in as ${_auth.currentUser!.email}", context);
//     })
//     .catchError( (error){
//       displayMessage(error, context);
//     } );