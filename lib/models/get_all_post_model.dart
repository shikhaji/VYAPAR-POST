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
    required this.vapLike,
    required this.vapComment,
    required this.vapLikeStatus,
    this.branchId,
    this.branchPhoto,
    this.branchContact,
    this.branchEmail,
  });

  String vapId;
  DateTime vapTt;
  String vapLoginId;
  String vapTitle;
  String vapDesc;
  String vapVideoType;
  String vapImage;
  String vapVideoUrl;
  String vapLike;
  String vapComment;
  int vapLikeStatus;
  String? branchId;
  String? branchPhoto;
  String? branchContact;
  String? branchEmail;

  factory AllPost.fromJson(Map<String, dynamic> json) => AllPost(
    vapId: json["VAP_ID"],
    vapTt: DateTime.parse(json["VAP_TT"]),
    vapLoginId: json["VAP_LOGIN_ID"],
    vapTitle: json["VAP_TITLE"],
    vapDesc: json["VAP_DESC"],
    vapVideoType: json["VAP_VIDEO_TYPE"],
    vapImage: json["VAP_IMAGE"],
    vapVideoUrl: json["VAP_VIDEO_URL"],
    vapLike: json["VAP_LIKE"],
    vapComment: json["VAP_COMMENT"],
    vapLikeStatus: json["VAP_LIKE_STATUS"],
    branchId: json["BRANCH_ID"],
    branchPhoto: json["BRANCH_PHOTO"],
    branchContact: json["BRANCH_CONTACT"],
    branchEmail: json["BRANCH_EMAIL"],
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
    "VAP_LIKE": vapLike,
    "VAP_COMMENT": vapComment,
    "VAP_LIKE_STATUS": vapLikeStatus,
    "BRANCH_ID": branchId,
    "BRANCH_PHOTO": branchPhoto,
    "BRANCH_CONTACT": branchContact,
    "BRANCH_EMAIL": branchEmail,
  };
}
