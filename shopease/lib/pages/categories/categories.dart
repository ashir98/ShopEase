import 'package:flutter/material.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/widgets/card/category_card.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),

      body: Padding(
        padding: defaultPadding,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return CategoryCard(
              imgUrl: AppImages.appLogo,
              title: "Electronics",
              subtitle: "Mobile, Tv, Refrigerator",
              onTap: () {
                
              },
            );
          },
        ),
      ),




    );
  }
}
