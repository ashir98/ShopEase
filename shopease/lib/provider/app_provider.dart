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


  bool _isGLoading = false;
  bool get isGLoading => _isGLoading;
  setGLoading(bool value){
    _isGLoading = value;
    notifyListeners();
  }

  

Set<String> _favourites = {}; // Store product IDs in a set for efficient membership testing

  Set<String> get favourites => _favourites;

  // Function to toggle the isFav status of a product
  void toggleFavourite(String productId) {
    if (_favourites.contains(productId)) {
      _favourites.remove(productId);
    } else {
      _favourites.add(productId);
    }
    notifyListeners(); // Notify listeners after the status changes
  }

  // Function to check if a product is a favorite
  bool isFavourite(String productId) {
    return _favourites.contains(productId);
  }


}