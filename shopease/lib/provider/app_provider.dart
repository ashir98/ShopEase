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



  // -- FAV BUTTON
  Map<String, bool> _favorites = {};

  // Method to check if a product with given id is marked as favorite
  bool isFav(String productId) {
    return _favorites.containsKey(productId) ? _favorites[productId]! : false;
  }

  // Method to toggle favorite status of a product with given id
  void addToFav(String productId) {
    if (_favorites.containsKey(productId)) {
      _favorites[productId] = !_favorites[productId]!;
    } else {
      _favorites[productId] = true;
    }
    notifyListeners();
  }
  


}