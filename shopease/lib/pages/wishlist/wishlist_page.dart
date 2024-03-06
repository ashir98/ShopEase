import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:lottie/lottie.dart';

class WishListPage extends StatelessWidget {
  WishListPage({super.key});


  FireStoreService _fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("My Wishlist"),
      ),


      body: Padding(
        padding: defaultPadding,
        child: StreamBuilder<List<ProductModel>>(
                stream: _fireStoreService.getFavoriteProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  } else {
        
                    if (!snapshot.data!.isEmpty) {

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65.h),
                        itemCount: snapshot.data!.length,
                        shrinkWrap:true, // Add this line to enable scrolling within the GridView
                        itemBuilder: (context, index) {
                          var id = snapshot.data![index].id;
                          var name = snapshot.data![index].name;
                          var imageUrl = snapshot.data![index].imageUrl;
                          var description = snapshot.data![index].description;
                          var price = snapshot.data![index].price;
                          var rating = snapshot.data![index].rating;
                          var status = snapshot.data![index].status;
        
        
        
        
                          return Consumer<AppChangeNotifier>(
                            builder:(context, provalue, child) =>  ProductCard(
                              id: id,
                              name:  name ,
                              imageUrl:  imageUrl,
                              price: price.toDouble(),
                              rating: rating,
                              isFav: true,
                              addToFav: (){
                                
                                _fireStoreService
                                .addToFavourites(id, context)
                                .then((value){
        
                                  
                                });
                              },
        
                              onTap: () {
                                gotoPage(
                                  ProductDetailPage(
                                    id: id, 
                                    name: name, 
                                    imageUrl: imageUrl,
                                    description: description,
                                    rating:  rating,
                            
                                  ), 
                                  context
                                );
                              },
                            ),
                          );
                        },
                      );
                      
                    } else {
                      return Column(
                        children: [
                          Column(
                            children: [
                              Lottie.asset(AppLottie.emptyWishlist, width: double.infinity, height:  300.h),
                              Text("Empty Wishlist",style: TextStyle(fontSize: 20.sp, color: AppColors.primaryColor),),
                            ],
                          ),

                          
                        ],
                      );
                      
                    }
                    
                  }
                },
        
              ),
      )
    );
  }
}