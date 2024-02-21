import 'package:card_swiper/card_swiper.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/images.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/buttons/category_button.dart';
import 'package:shopease/widgets/buttons/text_button.dart';
import 'package:shopease/widgets/card/carousel_card.dart';
import 'package:shopease/widgets/card/product_card.dart';
import 'package:shopease/widgets/text/title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  onTap: () {
                    
                  },
                )
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return CategoryButton();
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
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6.h),
              itemCount: 5,
              shrinkWrap: true, // Add this line to enable scrolling within the GridView
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
          ],
        ),
      ),
    ),
  );
}

}


