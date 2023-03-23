// To parse this JSON data, do
//
//     final getAllPostModel = getAllPostModelFromJson(jsonString);

import 'dart:convert';

GetAllPostModel getAllPostModelFromJson(String str) => GetAllPostModel.fromJson(json.decode(str));

String getAllPostModelToJson(GetAllPostModel data) => json.encode(data.toJson());

class GetAllPostModel {
  GetAllPostModel({
    required this.status,
    required this.message,
  });

  int status;
  Message message;

  factory GetAllPostModel.fromJson(Map<String, dynamic> json) => GetAllPostModel(
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
    required this.allPost,
  });

  List<AllPost> allPost;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    allPost: List<AllPost>.from(json["all_post"].map((x) => AllPost.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "all_post": List<dynamic>.from(allPost.map((x) => x.toJson())),
  };
}

class AllPost {
  AllPost({
    required this.vapId,
    required this.vapTt,
    required this.vapLoginId,
    required this.vapTitle,
    required this.vapDesc,
    required this.vapVideoType,
    required this.vapImage,
    required this.vapVideoUrl,
  });

  String vapId;
  DateTime vapTt;
  String vapLoginId;
  String vapTitle;
  String vapDesc;
  String vapVideoType;
  String vapImage;
  String vapVideoUrl;

  factory AllPost.fromJson(Map<String, dynamic> json) => AllPost(
    vapId: json["VAP_ID"],
    vapTt: DateTime.parse(json["VAP_TT"]),
    vapLoginId: json["VAP_LOGIN_ID"],
    vapTitle: json["VAP_TITLE"],
    vapDesc: json["VAP_DESC"],
    vapVideoType: json["VAP_VIDEO_TYPE"],
    vapImage: json["VAP_IMAGE"],
    vapVideoUrl: json["VAP_VIDEO_URL"],
  );

  Map<String, dynamic> toJson() => {
    "VAP_ID": vapId,
    "VAP_TT": vapTt.toIso8601String(),
    "VAP_LOGIN_ID": vapLoginId,
    "VAP_TITLE": vapTitle,
    "VAP_DESC": vapDesc,
    "VAP_VIDEO_TYPE": vapVideoType,
    "VAP_IMAGE": vapImage,
    "VAP_VIDEO_URL": vapVideoUrl,
  };
}
