import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/colors.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/firebase/auth_service/auth_service.dart';
import 'package:shopease/firebase/firestore/firestore_service.dart';
import 'package:shopease/main.dart';
import 'package:shopease/models/user_model.dart';
import 'package:shopease/pages/auth/signup.dart';
import 'package:shopease/pages/profile/edit_profile.dart';
import 'package:shopease/pages/wishlist/wishlist_page.dart';
import 'package:shopease/utils/helper_functions.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  AuthService _authService = AuthService();
  FireStoreService  _firestoreService = FireStoreService();






  @override
  Widget build(BuildContext context) {



    



List<ProfileTileModel> profileOptions = [
  ProfileTileModel(
    title: "My Account", 
    icon: FluentIcons.person_16_regular,
    onTap: () {

      gotoPage(MyAccount(), context);
      
    },
  ),
  ProfileTileModel(
    title: "My Order", 
    icon: FluentIcons.shopping_bag_16_regular,
    onTap: () {
      
    },
  ),
  ProfileTileModel(
    title: "My Address", 
    icon: FluentIcons.location_16_regular,
    onTap: () {
      
    },
  ),

  ProfileTileModel(
    title: "Payment Method", 
    icon: FluentIcons.payment_16_regular,
    onTap: () {
      
    },
  ),
  ProfileTileModel(
    title: "My Wishlist", 
    icon: FluentIcons.heart_16_regular,
    onTap: () {
      gotoPage(WishListPage(), context);
    },
  ),
  ProfileTileModel(
    title: "Account Settings", 
    icon: FluentIcons.settings_16_regular,
    onTap: () {
      
    },
  ),
  ProfileTileModel(
    title: "Logout", 
    icon: FluentIcons.sign_out_20_regular,
    onTap: () {
      
      showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Sign out"),
                content: Text("are you sure you want to sign out?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _authService.signout(context).then((value) {
                        removeAllAndGotoPage(ShopEase(), context);
                      });
                    },
                    child: Text("Yes"),
                  )
                ],
              );
            },
          );







    },
  ),

];







    return Scaffold(

      appBar: AppBar(
        title: Text("Profile"),
      ),

      body: StreamBuilder<UserModel>(
        stream: _firestoreService.getUserInfo(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return Center(
              child: CircularProgressIndicator(),
            );
            
          } else {
            var name = snapshot.data!.name;
            var firstName = snapshot.data!.firstName;
            var lastName = snapshot.data!.lastName;
            var email = snapshot.data!.email;



            return Padding(
            padding: defaultPadding,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                            child: Text( firstName[0] , style: TextStyle(fontSize: 40.sp),),
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
                        firstName.isEmpty && lastName.isEmpty? "$name" : " $firstName $lastName ",
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
                        onTap: profileOptions[index].onTap,
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
          );
          }



          
        }
      ),
    );
  }
}






class ProfileTileModel{
  IconData icon;
  String title;
  VoidCallback onTap;

  ProfileTileModel({
    required this.title,
    required this.icon,
    required this.onTap
  });


  
}

