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





//   Future<List<ProductModel>> fetchAllProducts() async {
//   final categoriesCollection = FirebaseFirestore.instance.collection('categories');
//   final productModels = <ProductModel>[];

//   // Fetch all category documents
//   final querySnapshot = await categoriesCollection.get();

//   // Iterate through each category document
//   for (final doc in querySnapshot.docs) {
//     final productsCollection = doc.reference.collection('products');

//     // Fetch all product documents from the current category
//     final productQuerySnapshot = await productsCollection.get();

//     // Iterate through each product document and add data to the list
//     for (final productDoc in productQuerySnapshot.docs) {
//       final productData = productDoc.data();
//       productModels.add(ProductModel.fromJson(productData));
//     }
//   }

//   return productModels;
// }

// // Example usage in a StreamBuilder
// Stream<List<ProductModel>> getPopularProducts() async* {
//   final productModels = await fetchAllProducts();
//   yield productModels;
// }




// Future<List<ProductModel>> getPopularProducts() async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await _firestore.collectionGroup("products").get();

//       List<ProductModel> bestSellingProducts = querySnapshot.docs
//           .map((e) => ProductModel.fromJson(e.data()))
//           .toList();
//       return bestSellingProducts;
//     } catch (e) {
//       return [];
//     }
//   }



  // Stream<List<ProductModel>> getPopularProducts() {
  //   return _firestore
  //       .collectionGroup('products') // This fetches all products from all categories
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.map((doc) {
  //             return ProductModel.fromJson(doc.data());
  //           }).toList());
  // }


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


}