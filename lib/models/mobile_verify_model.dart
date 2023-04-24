import 'dart:convert';

MobileVerifyModel mobileVerifyModelFromJson(String str) => MobileVerifyModel.fromJson(json.decode(str));

String mobileVerifyModelToJson(MobileVerifyModel data) => json.encode(data.toJson());

class MobileVerifyModel {
  MobileVerifyModel({
    this.status,
    this.message,
  });

  int? status;
  int? message;

  factory MobileVerifyModel.fromJson(Map<String, dynamic> json) => MobileVerifyModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
