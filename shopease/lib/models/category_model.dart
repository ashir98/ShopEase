class CategoryModel {
  CategoryModel({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.description,
    required this.icon
  });

  String id;
  String imageUrl;
  String name;
  String description;
  String icon;

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    
    return CategoryModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        icon: json["icon"]
      );
  }

  Map<String, dynamic> toJson() {
       return {
        "id": id,
        "name":name,
        "imageUrl": imageUrl,
        "description":description,
        "icon" : icon
       };
  }
}