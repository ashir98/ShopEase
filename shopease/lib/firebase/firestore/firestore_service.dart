import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopease/models/category_model.dart';
import 'package:shopease/models/product_model.dart';
import 'package:shopease/utils/helper_functions.dart';

class FireStoreService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // -- GET CATEGORIES
  Stream<List<CategoryModel>> getCategories() {
    return _firestore
        .collection('categories')
        .orderBy('name', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategoryModel.fromJson({
          'id': doc['id'],
          'name': doc['name'],
          'imageUrl': doc['imageUrl'],
          'description': doc['description'],
          'icon': doc['icon']
        });
      }).toList();
    });
  }

  // -- GET PRODUCTS
  Stream<List<ProductModel>> getPopularProducts() {
    return _firestore
        .collectionGroup('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    });
  }

  // -- ADD TO FAVOURITE
  Future addToFavourites(String productId, BuildContext context) async {


    try {
      DocumentReference userDoc =
          _firestore.collection('users').doc(_auth.currentUser!.uid);
      // -- get the current list of document snapshot
      DocumentSnapshot userSnapshot = await userDoc.get();
      Map<String, dynamic> docMap =
          userSnapshot.data() as Map<String, dynamic>;

      List<dynamic> favourites = docMap['favourites'];

      if (!favourites.contains(productId)) {

        favourites.add(productId.toString());
        await userDoc.update({
          'favourites': favourites
        }).then((value) {
          displayMessage("Added to wishlist", context);
        });

      } else {
        
        favourites.remove(productId.toString());
        await userDoc.update({
          'favourites': favourites
        }).then((value) {
          displayMessage("Removed from wishlist", context);
        });

        
        
        
          
      }
    } catch (e) {
      print('Error updating isFav status: $e');
      // Handle any potential errors here
    }
  }

  // -- GET FAVOURITE PRODUCTS
  Stream<List<ProductModel>> getFavoriteProducts() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .snapshots()
        .asyncMap((snapshot) async {
      List<dynamic> favorites = snapshot.data()?['favourites'] ?? [];

      // Fetch products for favorite IDs
      List<ProductModel> favoriteProducts = [];
      for (String productId in favorites) {
        QuerySnapshot productSnapshot = await _firestore
            .collectionGroup('products')
            .where('id', isEqualTo: productId)
            .get();
        if (productSnapshot.docs.isNotEmpty) {
          favoriteProducts.add(ProductModel.fromJson(
              productSnapshot.docs.first.data() as Map<String, dynamic>));
        }
      }

      return favoriteProducts;
    });
  }


}
