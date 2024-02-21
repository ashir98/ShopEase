import 'package:flutter/material.dart';

class AppChangeNotifier extends ChangeNotifier{

  // -- PASSWORD TOGGLE
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void passwordToggle(){
    _obscureText = !_obscureText;
    notifyListeners();
  }







  // -- BUTTON LOADER
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  


}