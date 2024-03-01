import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.imageUrl,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String? imageUrl;

factory UserModel.fromJson(Map<String, dynamic>? map) => UserModel(
  id: map?["id"] ?? "",
  firstName: map?["firstName"] ?? "",
  lastName: map?["lastName"],
  imageUrl: map?["imageUrl"],
  email: map?["email"] ?? "",
);

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
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