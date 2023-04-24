// To parse this JSON data, do
//
//     final getCityModel = getCityModelFromJson(jsonString);

import 'dart:convert';

GetCityModel getCityModelFromJson(String str) => GetCityModel.fromJson(json.decode(str));

String getCityModelToJson(GetCityModel data) => json.encode(data.toJson());

class GetCityModel {
  GetCityModel({
    this.status,
    this.message,
  });

  int? status;
  Message? message;

  factory GetCityModel.fromJson(Map<String, dynamic> json) => GetCityModel(
    status: json["status"],
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message?.toJson(),
  };
}

class Message {
  Message({
    required this.district,
  });

  List<District> district;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    district: List<District>.from(json["district"].map((x) => District.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "district": List<dynamic>.from(district.map((x) => x.toJson())),
  };
}

class District {
  District({
    required this.districtId,
    required this.districtName,
    required this.stateId,
  });

  String districtId;
  String districtName;
  String stateId;

  factory District.fromJson(Map<String, dynamic> json) => District(
    districtId: json["DISTRICT_ID"],
    districtName: json["DISTRICT_NAME"],
    stateId: json["STATE_ID"],
  );

  Map<String, dynamic> toJson() => {
    "DISTRICT_ID": districtId,
    "DISTRICT_NAME": districtName,
    "STATE_ID": stateId,
  };
}
