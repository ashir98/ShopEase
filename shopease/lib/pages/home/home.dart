import 'package:card_swiper/card_swiper.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/firebase/firestore/firestore_service.dart';
import 'package:shopease/models/category_model.dart';
import 'package:shopease/models/product_model.dart';
import 'package:shopease/pages/product_detail/product_detail.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/buttons/category_button.dart';
import 'package:shopease/widgets/buttons/text_button.dart';
import 'package:shopease/widgets/card/carousel_card.dart';
import 'package:shopease/widgets/card/product_card.dart';
import 'package:shopease/widgets/text/title.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  FireStoreService _fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppImages.appLogoHorizontal,
          width: 120.w,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FluentIcons.shopping_bag_16_regular, size: 25.sp,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              // -- SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  prefixIcon: Icon(FluentIcons.search_16_regular, color: Colors.grey.shade500),
                  hintText: "Search",
                ),
              ),
              10.verticalSpace,
              // -- CAROUSEL SLIDER
              SizedBox(
                height: 180.h,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    print("build");
                    return CarouselCard();
                  },
                  autoplay: true,
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.teal.shade200,
                      size: 5,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              // -- CATEGORIES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(text: "All Categories",),
                  CustomTextButton(
                    text: "see more",
                    onTap: () {},
                  )
                ],
              ),
              StreamBuilder<List<CategoryModel>>(
                stream: _fireStoreService.getCategories(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return CategoryButton(
                          icon: snapshot.data![index].icon,
                          name: snapshot.data![index].name,
                          onTap: () {},
                        );
                      },
                    );
                  }
                },
              ),
              20.verticalSpace,
              // -- PRODUCTS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(text: "Popular Products"),
                  CustomTextButton(
                    onTap: () {},
                    text: "See more"
                  )
                ],
              ),
              // -- PRODUCTS STREAM
              StreamBuilder<List<ProductModel>>(
                stream: _fireStoreService.getPopularProducts(),
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
                          // Create a map of favorite product IDs for efficient lookup
                          final Set<String> favoriteIds = Set.from(favSnapshot.data!.map((product) => product.id));
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65.h),
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
                                  id: id,
                                  name: name,
                                  imageUrl: imageUrl,
                                  price: price.toDouble(),
                                  rating: rating,
                                  isFav: isFav,
                                  addToFav: () {
                                    _fireStoreService.addToFavourites(id, context).then((value) {
                                      provalue.toggleFavourite(id);
                                    });
                                  },
                                  onTap: () {
                                    gotoPage(
                                      ProductDetailPage(
                                        id: id,
                                        name: name,
                                        imageUrl: imageUrl,
                                        description: description,
                                        rating: rating,
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
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}










// import 'package:card_swiper/card_swiper.dart';
// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:shopease/constants/images.dart';
// import 'package:shopease/constants/padding_sizes.dart';
// import 'package:shopease/firebase/firestore/firestore_service.dart';
// import 'package:shopease/models/category_model.dart';
// import 'package:shopease/models/product_model.dart';
// import 'package:shopease/pages/product_detail/product_detail.dart';
// import 'package:shopease/provider/app_provider.dart';
// import 'package:shopease/utils/helper_functions.dart';
// import 'package:shopease/widgets/buttons/category_button.dart';
// import 'package:shopease/widgets/buttons/text_button.dart';
// import 'package:shopease/widgets/card/carousel_card.dart';
// import 'package:shopease/widgets/card/product_card.dart';
// import 'package:shopease/widgets/text/title.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key});

//   FireStoreService _fireStoreService = FireStoreService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image.asset(
//           AppImages.appLogoHorizontal,
//           width: 120.w,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(FluentIcons.shopping_bag_16_regular, size: 25.sp,),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: defaultPadding,
//           child: Column(
//             children: [
//               // -- SEARCH BAR
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),

//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   fillColor: Colors.grey.shade100,
//                   filled: true,
//                   prefixIcon: Icon(FluentIcons.search_16_regular, color: Colors.grey.shade500),
//                   hintText: "Search",
//                 ),
//               ),
//               10.verticalSpace,
//               // -- CAROUSEL SLIDER
//               SizedBox(
//                 height: 180.h,
//                 child: Swiper(
//                   itemCount: 3,
//                   itemBuilder: (context, index) {
//                     print("build");
//                     return CarouselCard();
//                   },
//                   autoplay: true,
//                   indicatorLayout: PageIndicatorLayout.COLOR,
//                   pagination: SwiperPagination(
//                     alignment: Alignment.bottomCenter,
//                     builder: DotSwiperPaginationBuilder(
//                       color: Colors.white,
//                       activeColor: Colors.teal.shade200,
//                       size: 5,
//                     ),
//                   ),
//                 ),
//               ),
//               10.verticalSpace,
//               // -- CATEGORIES
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TitleText(text: "All Categories",),
//                   CustomTextButton(
//                     text: "see more",
//                     onTap: () {},
//                   )
//                 ],
//               ),
//               StreamBuilder<List<CategoryModel>>(
//                 stream: _fireStoreService.getCategories(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(child: CircularProgressIndicator(),);
//                   } else {
//                     return GridView.builder(
//                       shrinkWrap: true,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         return CategoryButton(
//                           icon: snapshot.data![index].icon,
//                           name: snapshot.data![index].name,
//                           onTap: () {},
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//               20.verticalSpace,
//               // -- PRODUCTS
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TitleText(text: "Popular Products"),
//                   CustomTextButton(
//                     onTap: () {},
//                     text: "See more"
//                   )
//                 ],
//               ),
//               // -- PRODUCTS STREAM
//               StreamBuilder<List<ProductModel>>(
//                 stream: _fireStoreService.getPopularProducts(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(child: CircularProgressIndicator(),);
//                   } else {
//                     // Fetch favorite products
//                     return StreamBuilder<List<ProductModel>>(
//                       stream: _fireStoreService.getFavoriteProducts(),
//                       builder: (context, favSnapshot) {
//                         if (!favSnapshot.hasData) {
//                           return Center(child: CircularProgressIndicator(),);
//                         } else {
//                           // Create a map of favorite product IDs for efficient lookup
//                           final Set<String> favoriteIds = Set.from(favSnapshot.data!.map((product) => product.id));
//                           return GridView.builder(
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65.h),
//                             itemCount: snapshot.data!.length,
//                             shrinkWrap:true, // Add this line to enable scrolling within the GridView
//                             itemBuilder: (context, index) {
//                               var product = snapshot.data![index];
//                               var id = product.id;
//                               var name = product.name;
//                               var imageUrl = product.imageUrl;
//                               var description = product.description;
//                               var price = product.price;
//                               var rating = product.rating;
//                               var status = product.status;

//                               // Check if the product ID exists in the favorite list
//                               bool isFav = favoriteIds.contains(id);

//                               return Consumer<AppChangeNotifier>(
//                                 builder: (context, provalue, child) => ProductCard(
//                                   id: id,
//                                   name: name,
//                                   imageUrl: imageUrl,
//                                   price: price.toDouble(),
//                                   rating: rating,
//                                   isFav: isFav,
//                                   addToFav: () {
//                                     _fireStoreService.addToFavourites(id, context).then((value) {
//                                       provalue.toggleFavourite(id);
//                                     });
//                                   },
//                                   onTap: () {
//                                     gotoPage(
//                                       ProductDetailPage(
//                                         id: id,
//                                         name: name,
//                                         imageUrl: imageUrl,
//                                         description: description,
//                                         rating: rating,
//                                       ),
//                                       context
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                       },
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
