import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopease/models/category_model.dart';

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







}