// To parse this JSON data, do
//
//     final getFaqModel = getFaqModelFromJson(jsonString);

import 'dart:convert';

GetFaqModel getFaqModelFromJson(String str) => GetFaqModel.fromJson(json.decode(str));

String getFaqModelToJson(GetFaqModel data) => json.encode(data.toJson());

class GetFaqModel {
  GetFaqModel({
    required this.status,
    required this.message,
  });

  int status;
  Message message;

  factory GetFaqModel.fromJson(Map<String, dynamic> json) => GetFaqModel(
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
    required this.fquestion,
  });

  List<Fquestion> fquestion;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    fquestion: List<Fquestion>.from(json["fquestion"].map((x) => Fquestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fquestion": List<dynamic>.from(fquestion.map((x) => x.toJson())),
  };
}

class Fquestion {
  Fquestion({
    required this.fquestionId,
    required this.fquestionTt,
    required this.fquestion,
    required this.fanswer,
    required this.fstatus,
  });

  String fquestionId;
  DateTime fquestionTt;
  String fquestion;
  String fanswer;
  String fstatus;

  factory Fquestion.fromJson(Map<String, dynamic> json) => Fquestion(
    fquestionId: json["FQUESTION_ID"],
    fquestionTt: DateTime.parse(json["FQUESTION_TT"]),
    fquestion: json["FQUESTION"],
    fanswer: json["FANSWER"],
    fstatus: json["FSTATUS"],
  );

  Map<String, dynamic> toJson() => {
    "FQUESTION_ID": fquestionId,
    "FQUESTION_TT": fquestionTt.toIso8601String(),
    "FQUESTION": fquestion,
    "FANSWER": fanswer,
    "FSTATUS": fstatus,
  };
}
