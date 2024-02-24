
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopease/pages/navigation.dart';
import 'package:shopease/utils/helper_functions.dart';

class AuthService{


  // -- FIRBBASE  INSTANCES
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;



  // -- USER SIGN UP
  Future signup(String firstName, lastName, phone,email, password,  BuildContext context)async{
    await _auth
    .createUserWithEmailAndPassword(email: email, password: password)
    .then((value){

      _auth.currentUser!.sendEmailVerification();

      displayMessage("A verification email has been sent to your email", context);


      _db.collection('users')
      .doc(_auth.currentUser!.uid)
      .set({
        'id' : _auth.currentUser!.uid,
        'firstName' : firstName,
        'lastName' : lastName,
        'phone':phone,
        'email':email,
        'isVerified' : false

      });

    }).catchError( (error){
      displayMessage(error, context);
    } );


  }













  // -- USER SIGN IN
  Future signIn(String email, password, BuildContext context )async{
    _auth
    .signInWithEmailAndPassword(email: email, password: password);

    User? user = _auth.currentUser;

    if (user!=null && user.emailVerified) {
      _db
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .set({
        'isVerified' : true
      });

      displayMessage("Logged in as ${_auth.currentUser!.email}", context);




      
    }else{

      displayMessage("Email not verified, please verify your email", context);
    }
    
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