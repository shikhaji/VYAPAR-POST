import 'dart:convert';

ProfileContantModel profileContantModelFromJson(String str) => ProfileContantModel.fromJson(json.decode(str));

String profileContantModelToJson(ProfileContantModel data) => json.encode(data.toJson());

class ProfileContantModel {
  ProfileContantModel({
    required this.status,
     this.message,
  });

  int status;
  Message? message;

  factory ProfileContantModel.fromJson(Map<String, dynamic> json) => ProfileContantModel(
    status: json["status"],
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message!.toJson(),
  };
}

class Message {
  Message({
     this.category,
     this.profile,
  });

  List<Category>? category;
  Profile? profile;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
    "profile": profile!.toJson(),
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

class Profile {
  Profile({
     this.branchId,
    this.firmId,
     this.branchName,
    this.branchCode,
    this.branchAddress,
    this.branchState,
    this.branchCity,
     this.branchContact,
    this.branchPhone,
     this.branchEmail,
    this.branchTarget,
    this.branchCreated,
     this.branchTt,
    this.branchUsername,
     this.branchPassword,
     this.branchStatus,
    this.companyHrmType,
    this.parentId,
    this.parentType,
    this.sponserId,
    this.upperId,
    this.startDate,
     this.branchViewPassword,
     this.categoryId,
     this.branchKycStatus,
     this.sponserName,
  });

  String? branchId;
  dynamic firmId;
  String? branchName;
  dynamic branchCode;
  dynamic branchAddress;
  dynamic branchState;
  dynamic branchCity;
  String? branchContact;
  dynamic branchPhone;
  String? branchEmail;
  dynamic branchTarget;
  dynamic branchCreated;
  DateTime? branchTt;
  dynamic branchUsername;
  String? branchPassword;
  String? branchStatus;
  dynamic companyHrmType;
  dynamic parentId;
  dynamic parentType;
  dynamic sponserId;
  dynamic upperId;
  dynamic startDate;
  String? branchViewPassword;
  String? categoryId;
  String? branchKycStatus;
  String? sponserName;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    branchId: json["BRANCH_ID"],
    firmId: json["FIRM_ID"],
    branchName: json["BRANCH_NAME"],
    branchCode: json["BRANCH_CODE"],
    branchAddress: json["BRANCH_ADDRESS"],
    branchState: json["BRANCH_STATE"],
    branchCity: json["BRANCH_CITY"],
    branchContact: json["BRANCH_CONTACT"],
    branchPhone: json["BRANCH_PHONE"],
    branchEmail: json["BRANCH_EMAIL"],
    branchTarget: json["BRANCH_TARGET"],
    branchCreated: json["BRANCH_CREATED"],
    branchTt: DateTime.parse(json["BRANCH_TT"]),
    branchUsername: json["BRANCH_USERNAME"],
    branchPassword: json["BRANCH_PASSWORD"],
    branchStatus: json["BRANCH_STATUS"],
    companyHrmType: json["COMPANY_HRM_TYPE"],
    parentId: json["PARENT_ID"],
    parentType: json["PARENT_TYPE"],
    sponserId: json["SPONSER_ID"],
    upperId: json["UPPER_ID"],
    startDate: json["START_DATE"],
    branchViewPassword: json["BRANCH_VIEW_PASSWORD"],
    categoryId: json["CATEGORY_ID"],
    branchKycStatus: json["BRANCH_KYC_STATUS"],
    sponserName: json["SPONSER_NAME"],
  );

  Map<String, dynamic> toJson() => {
    "BRANCH_ID": branchId,
    "FIRM_ID": firmId,
    "BRANCH_NAME": branchName,
    "BRANCH_CODE": branchCode,
    "BRANCH_ADDRESS": branchAddress,
    "BRANCH_STATE": branchState,
    "BRANCH_CITY": branchCity,
    "BRANCH_CONTACT": branchContact,
    "BRANCH_PHONE": branchPhone,
    "BRANCH_EMAIL": branchEmail,
    "BRANCH_TARGET": branchTarget,
    "BRANCH_CREATED": branchCreated,
    "BRANCH_TT": branchTt!.toIso8601String(),
    "BRANCH_USERNAME": branchUsername,
    "BRANCH_PASSWORD": branchPassword,
    "BRANCH_STATUS": branchStatus,
    "COMPANY_HRM_TYPE": companyHrmType,
    "PARENT_ID": parentId,
    "PARENT_TYPE": parentType,
    "SPONSER_ID": sponserId,
    "UPPER_ID": upperId,
    "START_DATE": startDate,
    "BRANCH_VIEW_PASSWORD": branchViewPassword,
    "CATEGORY_ID": categoryId,
    "BRANCH_KYC_STATUS": branchKycStatus,
    "SPONSER_NAME": sponserName,
  };
}
