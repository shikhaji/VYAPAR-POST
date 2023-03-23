// To parse this JSON data, do
//
//     final getPlanModel = getPlanModelFromJson(jsonString);

import 'dart:convert';

GetPlanModel getPlanModelFromJson(String str) => GetPlanModel.fromJson(json.decode(str));

String getPlanModelToJson(GetPlanModel data) => json.encode(data.toJson());

class GetPlanModel {
  GetPlanModel({
    required this.status,
    required this.message,
  });

  int status;
  Message message;

  factory GetPlanModel.fromJson(Map<String, dynamic> json) => GetPlanModel(
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
    required this.planList,
  });

  List<PlanList> planList;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    planList: List<PlanList>.from(json["plan_list"].map((x) => PlanList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plan_list": List<dynamic>.from(planList.map((x) => x.toJson())),
  };
}

class PlanList {
  PlanList({
    required this.vcpId,
    required this.vcpTt,
    required this.vcpPlanName,
    required this.vcpMonth,
    required this.vcpOffferPrice,
    required this.vcpDiscountPrice,
    required this.vcpDiscountPercentage,
    required this.vcpShortDesc,
    required this.vcpStatus,
    required this.vcpImage,
  });

  String vcpId;
  DateTime vcpTt;
  String vcpPlanName;
  String vcpMonth;
  String vcpOffferPrice;
  String vcpDiscountPrice;
  String vcpDiscountPercentage;
  String vcpShortDesc;
  String vcpStatus;
  String vcpImage;

  factory PlanList.fromJson(Map<String, dynamic> json) => PlanList(
    vcpId: json["VCP_ID"],
    vcpTt: DateTime.parse(json["VCP_TT"]),
    vcpPlanName: json["VCP_PLAN_NAME"],
    vcpMonth: json["VCP_MONTH"],
    vcpOffferPrice: json["VCP_OFFFER_PRICE"],
    vcpDiscountPrice: json["VCP_DISCOUNT_PRICE"],
    vcpDiscountPercentage: json["VCP_DISCOUNT_PERCENTAGE"],
    vcpShortDesc: json["VCP_SHORT_DESC"],
    vcpStatus: json["VCP_STATUS"],
    vcpImage: json["VCP_IMAGE"],
  );

  Map<String, dynamic> toJson() => {
    "VCP_ID": vcpId,
    "VCP_TT": vcpTt.toIso8601String(),
    "VCP_PLAN_NAME": vcpPlanName,
    "VCP_MONTH": vcpMonth,
    "VCP_OFFFER_PRICE": vcpOffferPrice,
    "VCP_DISCOUNT_PRICE": vcpDiscountPrice,
    "VCP_DISCOUNT_PERCENTAGE": vcpDiscountPercentage,
    "VCP_SHORT_DESC": vcpShortDesc,
    "VCP_STATUS": vcpStatus,
    "VCP_IMAGE": vcpImage,
  };
}
