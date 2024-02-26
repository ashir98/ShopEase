import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopease/models/category_model.dart';
import 'package:shopease/models/product_model.dart';

class FireStoreService{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // -- GET CATEGORIES
  Stream<List<CategoryModel>> getCategories(){
    return 
    
    _firestore
    .collection('categories')
    .snapshots()
    .map((snapshot){

      return snapshot.docs.map((doc){

        return CategoryModel.fromJson({
          'id':doc['id'],
          'name': doc['name'],
          'imageUrl' : doc['imageUrl'],
          'description': doc['description'],
          'icon' : doc['icon']
        });

      }).toList();

    });
  }



  // -- GET PRODUCTS
  Stream<List<ProductModel>> getPopularProducts(){

    return _firestore
    .collectionGroup('products')
    .snapshots()
    .map((snapshot){

      return snapshot.docs.map((doc){

        return ProductModel.fromJson(doc.data());

      }).toList();

    });

  }



  // -- ADD TO FAVOURITE
  Future addToFavourites(String productId, bool isFav)async{
        try {
      QuerySnapshot querySnapshot = await _firestore
          .collectionGroup('products')
          .where('id', isEqualTo: productId )
          .get();

      querySnapshot.docs.forEach((doc) async {
        await doc.reference.update({'isFav': isFav});
      });
    } catch (e) {
      print('Error updating isFav status: $e');
      // Handle any potential errors here
    }
  }



Stream<List<ProductModel>> getFavoriteProducts() {
  return _firestore
      .collectionGroup('products')
      .where('isFav', isEqualTo: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>; // Explicit cast
            return ProductModel.fromJson(data);
          }).toList());
}


}