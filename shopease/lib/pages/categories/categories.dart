import 'package:flutter/material.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/firebase/firestore/firestore_service.dart';
import 'package:shopease/models/category_model.dart';
import 'package:shopease/pages/categories/category_view.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/card/category_card.dart';


class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  FireStoreService _fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),

      body: Padding(
        padding: defaultPadding,
        child: StreamBuilder<List<CategoryModel>>(
          stream: _fireStoreService.getCategories(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center( child: CircularProgressIndicator(),);
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  imageUrl: snapshot.data![index].imageUrl,
                  name: snapshot.data![index].name,
                  description: snapshot.data![index].description,
                  onTap: () {
                    gotoPage(CategoryView(catId: snapshot.data![index].id, catName: snapshot.data![index].name,), context);
                  },
                );
              },
            );
            }
          }
        ),
      ),




    );
  }
}
