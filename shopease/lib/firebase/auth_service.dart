
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    
  }

}