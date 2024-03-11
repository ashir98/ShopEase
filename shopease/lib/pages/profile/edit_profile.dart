import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopease/constants/padding_sizes.dart';
import 'package:shopease/firebase/auth_service/auth_service.dart';
import 'package:shopease/firebase/firestore/firestore_service.dart';
import 'package:shopease/models/user_model.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/utils/helper_functions.dart';
import 'package:shopease/widgets/buttons/custom_button.dart';
import 'package:shopease/widgets/textfield/custom_textfield.dart';

class MyAccount extends StatelessWidget {
  MyAccount({super.key});


    // -- FORM KEY
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // -- AUTH SERVICE INSTANCE
  AuthService _authService = AuthService();
  FireStoreService _fireStoreService = FireStoreService();

  

  // -- CONTROLLERS
  TextEditingController firstNameContoller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneContoller = TextEditingController();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),



      body: StreamBuilder<UserModel>(
        stream: _fireStoreService.getUserInfo(),
        builder: (context, snapshot) {

          if(!snapshot.hasData){

            return Center(
              child: CircularProgressIndicator(),
            );


          }else{

            firstNameContoller.text = snapshot.data!.firstName;
            lastNameController.text = snapshot.data!.lastName;
            phoneContoller.text = snapshot.data!.phone;



            return Padding(
              padding: defaultPadding,
              child: SingleChildScrollView(
                child: Column(
                children:[
                          
                  // -- FORM
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // -- FIRST NAME FIELD,
                              CustomTextField(
                                controller: firstNameContoller,
                                hintText: "First name",
                                prefixIcon: FluentIcons.person_16_regular,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name";
                                  }
                                },
                              ),
                
                
                              15.verticalSpace,
                
                
                
                    
                          
                              // -- LAST NAME FIELD
                              CustomTextField(
                                controller: lastNameController,
                                hintText: "Last name",
                                prefixIcon: FluentIcons.person_16_regular,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name";
                                  }
                                },
                              ),
                
                              15.verticalSpace,
                    
                            
                              // -- PHONE FIELD
                              CustomTextField(
                                controller: phoneContoller,
                                keyboardType: TextInputType.phone,
                                hintText: "Phone number",
                                prefixIcon: FluentIcons.phone_16_regular,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your phone number";
                                  }
                                },
                              ),
                          
                          
                    
                    
                          
                    
                    
                    
                            ],
                          ),
                        ),
                
                
                        15.verticalSpace,
                          
                          
                        Consumer<AppChangeNotifier>(
                          builder: (context, provalue, child) =>  CustomButton(

                            isLoading: provalue.isLoading,
                            
                            title: "Save changes", 
                            onTap: (){

                              
                          
                          
                          
                              if (_formKey.currentState!.validate()) {
                                provalue.setLoading(true);
                          
                                _fireStoreService.updateUserInfo(
                                  firstNameContoller.text, 
                                  lastNameController.text, 
                                  phoneContoller.text
                                ).then((value){
                                  provalue.setLoading(false);
                                  displayMessage("Profile updated", context);
                                }).catchError((error){
                                  provalue.setLoading(false);

                                });
                                
                              }
                              
                            }
                          ),
                        )
                          
                          
                          
                          
                          
                          
                ]
                          ),
              ),
            );
          }
         
        }
      )







      



    );
  }
}