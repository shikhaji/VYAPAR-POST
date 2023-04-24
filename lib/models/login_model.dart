// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
     this.status,
     this.message,
     this.id,
     this.token,
     this.branchKycStatus,
  });

  int? status;
  String? message;
  String? id;
  String? token;
  String? branchKycStatus;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    id: json["id"],
    token: json["token"],
    branchKycStatus: json["BRANCH_KYC_STATUS"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "id": id,
    "token": token,
    "BRANCH_KYC_STATUS": branchKycStatus,
  };
}
