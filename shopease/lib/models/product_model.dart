class ProductModel{
  String id;
  String title;
  String imageUrl;
  String description;
  String status;
  bool isFav;
  double price;


  ProductModel({

    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.status,
    required this.isFav,
    required this.price
  });


  factory ProductModel.fromJson(Map<String, dynamic> map){
    return ProductModel(
      id: map['id'], 
      title: map['title'], 
      imageUrl: map['imageUrl'], 
      description: map['description'], 
      status: map['status'], 
      isFav: map['isFav'], 
      price: map['price']
    );
  }




  Map<String , dynamic> toJson(){

    return {
      'id' : id,
      'title' :title,
      'imageUrl' : imageUrl,
      'description':description,
      'status' : status,
      'isFav' : isFav,
      'price' : price
    };

  }









}