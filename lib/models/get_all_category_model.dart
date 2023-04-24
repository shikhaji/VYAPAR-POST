// To parse this JSON data, do
//
//     final getAllCategoryModel = getAllCategoryModelFromJson(jsonString);

import 'dart:convert';

GetAllCategoryModel getAllCategoryModelFromJson(String str) => GetAllCategoryModel.fromJson(json.decode(str));

String getAllCategoryModelToJson(GetAllCategoryModel data) => json.encode(data.toJson());

class GetAllCategoryModel {
  GetAllCategoryModel({
    required this.status,
    required this.message,
  });

  int status;
  Message message;

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json) => GetAllCategoryModel(
    status: json["status"],
    message: Message.fromJson(json["message"]),
  );


  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message.toJson(),
  };
}

class Message {
  Message({
    required this.category,
  });

  List<Category> category;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class Category {
  Category({
     this.id,
     this.vendorId,
     this.brandName,
     this.status,
     this.date,
     this.brandImage,
  });

  String? id;
  String? vendorId;
  String? brandName;
  String? status;
  String? date;
  String? brandImage;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    vendorId: json["vendor_id"],
    brandName: json["brand_name"],
    status: json["status"],
    date: json["date"],
    brandImage: json["brand_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "brand_name": brandName,
    "status": status,
    "date": date,
    "brand_image": brandImage,
  };
}
