class ProductModel{
  String id;
  String name;
  String imageUrl;
  String description;
  String status;
  double rating;
  int price;


  ProductModel({

    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.status,
    required this.price,
    required this.rating
  });


  factory ProductModel.fromJson(Map<String, dynamic> map){
    return ProductModel(
      id: map['id'], 
      name: map['name'], 
      imageUrl: map['imageUrl'], 
      description: map['description'], 
      status: map['status'], 
      price: map['price'],
      rating: map['rating']
    );
  }




  Map<String , dynamic> toJson(){

    return {
      'id' : id,
      'name' : name,
      'imageUrl' : imageUrl,
      'description':description,
      'status' : status,
      'price' : price,
      'rating' : rating
    };

  }









}