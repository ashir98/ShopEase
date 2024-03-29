import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopease/pages/navigation.dart';
import 'package:shopease/pages/welcome/splash.dart';
import 'package:shopease/pages/welcome/welcome.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SplashScreen(page: ScreenNavigation());
        } else {

          return SplashScreen(page: WelcomePage());
          
        }
      },
    );
  }
}