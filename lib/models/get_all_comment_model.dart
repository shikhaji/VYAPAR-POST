// To parse this JSON data, do
//
//     final getAllCommentModel = getAllCommentModelFromJson(jsonString);

import 'dart:convert';

GetAllCommentModel getAllCommentModelFromJson(String str) => GetAllCommentModel.fromJson(json.decode(str));

String getAllCommentModelToJson(GetAllCommentModel data) => json.encode(data.toJson());

class GetAllCommentModel {
  GetAllCommentModel({
    this.status,
    this.message,
  });

  int? status;
  List<Message>? message;

  factory GetAllCommentModel.fromJson(Map<String, dynamic> json) => GetAllCommentModel(
    status: json["status"],
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.commentId,
    this.commentBy,
    this.commentById,
    this.commentDesc,
  });

  String? commentId;
  String? commentBy;
  String? commentById;
  String? commentDesc;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    commentId: json["COMMENT_ID"],
    commentBy: json["COMMENT_BY"],
    commentById: json["COMMENT_BY_ID"],
    commentDesc: json["COMMENT_DESC"],
  );

  Map<String, dynamic> toJson() => {
    "COMMENT_ID": commentId,
    "COMMENT_BY": commentBy,
    "COMMENT_BY_ID": commentById,
    "COMMENT_DESC": commentDesc,
  };
}
