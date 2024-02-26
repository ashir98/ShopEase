import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/firebase/firestore/firestore_service.dart';
import 'package:shopease/models/product_model.dart';
import 'package:shopease/pages/product_detail/product_detail.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/card/product_card.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});


  FireStoreService _fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Profile"),
      ),


      body: StreamBuilder<List<ProductModel>>(
              stream: _fireStoreService.getFavoriteProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(),);
                } else {

                  return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                        var isFav = snapshot.data![index].isFav;
                        var status = snapshot.data![index].status;


                        print(snapshot.data!.length.toString());


                        return Consumer<AppChangeNotifier>(
                          builder:(context, value, child) =>  ProductCard(
                            id: id,
                            name:  name ,
                            imageUrl:  imageUrl,
                            price: price.toDouble(),
                            rating: rating,
                            isFav: isFav,
                            addToFav: (){
                              value.addToFav(id);
                              _fireStoreService.addToFavourites(id, value.isFav(id));
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
                  
                }
              },

            )
    );
  }
}