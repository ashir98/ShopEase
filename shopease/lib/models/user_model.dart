import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.imageUrl,
  });

  String id;
  String name;
  String firstName;
  String lastName;
  String phone;
  String email;
  String? imageUrl;

factory UserModel.fromJson(Map<String, dynamic>? map) => UserModel(
  id: map?["id"] ?? "",
  name: map?["name"]  ?? "",
  firstName: map?["firstName"] ?? "",
  lastName: map?["lastName"],
  phone:  map?["phone"] ?? "",
  imageUrl: map?["imageUrl"],
  email: map?["email"] ?? "",
);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name":name,
        "firstName": firstName,
        "lastName": lastName,
        "phone":phone,
        "email":email  ,
        "imageUrl" : imageUrl
  };


    //   UserModel copyWith({
    //   String? image, name,
    // })=>UserModel(
    //   id: id,
    //   name: name??this.name, 
    //   email: email,
    //   image: image??this.image,
    // );



}