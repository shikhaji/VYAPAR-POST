class GetAllCategoryModel {
  int? status;
  Message? message;

  GetAllCategoryModel({this.status, this.message});

  GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  List<GetCategory>? category;

  Message({this.category});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <GetCategory>[];
      json['category'].forEach((v) {
        category!.add(new GetCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCategory {
  String? id;
  String? vendorId;
  String? brandName;
  String? status;
  String? date;
  String? brandImage;

  GetCategory(
      {this.id,
        this.vendorId,
        this.brandName,
        this.status,
        this.date,
        this.brandImage});

  GetCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandName = json['brand_name'];
    status = json['status'];
    date = json['date'];
    brandImage = json['brand_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_name'] = this.brandName;
    data['status'] = this.status;
    data['date'] = this.date;
    data['brand_image'] = this.brandImage;
    return data;
  }
}