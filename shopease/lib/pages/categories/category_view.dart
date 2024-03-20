import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/lottie.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/firebase/firestore/firestore_service.dart';
import 'package:shopease/models/product_model.dart';
import 'package:shopease/pages/product_detail/product_detail.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/card/product_card.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.catId, required this.catName});

  String catId;
  String catName;
  FireStoreService _fireStoreService = FireStoreService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // -- APPBAR
      appBar: AppBar(
        title: Text(catName),
      ),


      // -- PRODUCT LIST
      body: Padding(
        padding: defaultPadding,
        child: StreamBuilder<List<ProductModel>>(
                  stream: _fireStoreService.getProductsCategory(catId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator(),);
                    } else {
                      // Fetch favorite products
                      return StreamBuilder<List<ProductModel>>(
                        stream: _fireStoreService.getFavoriteProducts(),
                        builder: (context, favSnapshot) {
                          if (!favSnapshot.hasData) {
                            return Center(child: CircularProgressIndicator(),);
                          } else {


                            if (!snapshot.data!.isEmpty) {
                              // Create a map of favorite product IDs for efficient lookup
                            final List<String> favoriteIds = favSnapshot.data!.map((product) => product.id).toList();
                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.55.h),
                              itemCount: snapshot.data!.length,
                              shrinkWrap:true, // Add this line to enable scrolling within the GridView
                              itemBuilder: (context, index) {
                                var product = snapshot.data![index];
                                var id = product.id;
                                var name = product.name;
                                var imageUrl = product.imageUrl;
                                var description = product.description;
                                var price = product.price;
                                var rating = product.rating;
                                var status = product.status;
        
                                // Check if the product ID exists in the favorite list
                                bool isFav = favoriteIds.contains(id);
        
                                return Consumer<AppChangeNotifier>(
                                  builder: (context, provalue, child) => ProductCard(
                                    
                                    product: product,
                                    isFav: isFav,
                                    addToFav: () {
                                      _fireStoreService.addToFavourites(id, context).then((value) {
                                        provalue.toggleFavourite(id);
                                      });
                                    },
                                    onTap: () {
                                      gotoPage(
                                        ProductDetailPage(
                                          product: product,
                                        ),
                                        context
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                              
                            } else {

                              return Center(
                                child: Column(
                                  children: [
                                    Lottie.asset(AppLottie.emptyWishlist),
                                    15.verticalSpace,
                                    Text(
                                      "No Products in this category", 
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                
                                  ],
                                ),
                              );
                              
                            }



                            
                          }
                        },
                      );
                    }
                  },
                ),
      ),



    );
  }
}
