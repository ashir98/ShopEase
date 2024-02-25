import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/padding_sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Profile"),
      ),

      body: Padding(
        padding: defaultPadding,
        child: SingleChildScrollView(
          child: Column(
          
            children: [
              // -- TOP SECTION
              Column(
                children: [
          
                  // -- PROFILE PIC
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55.r,
                        child: Text("A", style: TextStyle(fontSize: 40.sp),),
                      ),
                  
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.primaryColor,
                        child: Center(child: Icon(FluentIcons.camera_16_regular, color: Colors.white,size: 20.r,)),
                      )
                      
                    ],
                  ),
          
                  5.verticalSpace,
          
                  // -- NAME
                  Text(
                    "Syed Ashir Ali",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),

              20.verticalSpace,
          
          
          
              // -- PROFILE TILES
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: profileOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(profileOptions[index].icon),
                    title: Text( profileOptions[index].title ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  );
                },
          
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 50,
                    endIndent: 20,
                  );
                },
              )
              
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}






class ProfileTileModel{
  IconData icon;
  String title;

  ProfileTileModel({
    required this.title,
    required this.icon
  });


  
}





List<ProfileTileModel> profileOptions = [
  ProfileTileModel(
    title: "My Account", 
    icon: FluentIcons.person_16_regular
  ),
  ProfileTileModel(
    title: "My Order", 
    icon: FluentIcons.shopping_bag_16_regular
  ),
  ProfileTileModel(
    title: "My Address", 
    icon: FluentIcons.location_16_regular
  ),
  ProfileTileModel(
    title: "My Account", 
    icon: FluentIcons.person_16_regular
  ),
  ProfileTileModel(
    title: "Payment Method", 
    icon: FluentIcons.payment_16_regular
  ),
  ProfileTileModel(
    title: "My Wishlist", 
    icon: FluentIcons.heart_16_regular
  ),
  ProfileTileModel(
    title: "Account Settings", 
    icon: FluentIcons.settings_16_regular
  ),
  ProfileTileModel(
    title: "Logout", 
    icon: FluentIcons.sign_out_20_regular
  ),

];