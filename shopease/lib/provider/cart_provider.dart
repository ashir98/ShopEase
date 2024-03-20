import 'package:flutter/material.dart';
import 'package:shopease/models/product_model.dart';

class CartNotifier extends ChangeNotifier{

  List<ProductModel> _cartList =[];
  List<ProductModel> get cartList => _cartList;


  void addToCart(ProductModel product){
    _cartList.add(product);
    notifyListeners();
  }


  void removeFromCart(ProductModel product){
    _cartList.remove(product);
    notifyListeners();
  }





}