// To parse this JSON data, do
//
//     final myPostModel = myPostModelFromJson(jsonString);

import 'dart:convert';

MyPostModel myPostModelFromJson(String str) => MyPostModel.fromJson(json.decode(str));

String myPostModelToJson(MyPostModel data) => json.encode(data.toJson());

class MyPostModel {
  MyPostModel({
    this.status,
    this.message,
  });

  int? status;
  Message? message;

  factory MyPostModel.fromJson(Map<String, dynamic> json) => MyPostModel(
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
    required this.post,
  });

  List<Post> post;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    post: List<Post>.from(json["POST"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "POST": List<dynamic>.from(post.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.vapId,
    this.vapLoginId,
    this.vapTitle,
    this.vapDesc,
    this.vapVideoType,
    this.vapImage,
    this.vapVideoUrl,
    this.vapLike,
    this.vapComment,
    this.branchId,
    this.branchName,
    this.branchContact,
    this.branchPhoto,
  });

  String? vapId;
  String? vapLoginId;
  String? vapTitle;
  String? vapDesc;
  String? vapVideoType;
  String? vapImage;
  String? vapVideoUrl;
  String? vapLike;
  String? vapComment;
  String? branchId;
  String? branchName;
  String? branchContact;
  String? branchPhoto;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    vapId: json["VAP_ID"],
    vapLoginId: json["VAP_LOGIN_ID"],
    vapTitle: json["VAP_TITLE"],
    vapDesc: json["VAP_DESC"],
    vapVideoType: json["VAP_VIDEO_TYPE"],
    vapImage: json["VAP_IMAGE"],
    vapVideoUrl: json["VAP_VIDEO_URL"],
    vapLike: json["VAP_LIKE"],
    vapComment: json["VAP_COMMENT"],
    branchId: json["BRANCH_ID"],
    branchName: json["BRANCH_NAME"],
    branchContact: json["BRANCH_CONTACT"],
    branchPhoto: json["BRANCH_PHOTO"],
  );

  Map<String, dynamic> toJson() => {
    "VAP_ID": vapId,
    "VAP_LOGIN_ID": vapLoginId,
    "VAP_TITLE": vapTitle,
    "VAP_DESC": vapDesc,
    "VAP_VIDEO_TYPE": vapVideoType,
    "VAP_IMAGE": vapImage,
    "VAP_VIDEO_URL": vapVideoUrl,
    "VAP_LIKE": vapLike,
    "VAP_COMMENT": vapComment,
    "BRANCH_ID": branchId,
    "BRANCH_NAME": branchName,
    "BRANCH_CONTACT": branchContact,
    "BRANCH_PHOTO": branchPhoto,
  };
}
