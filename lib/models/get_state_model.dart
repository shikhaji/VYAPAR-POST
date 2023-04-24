// To parse this JSON data, do
//
//     final getStateModel = getStateModelFromJson(jsonString);

import 'dart:convert';

GetStateModel getStateModelFromJson(String str) => GetStateModel.fromJson(json.decode(str));

String getStateModelToJson(GetStateModel data) => json.encode(data.toJson());

class GetStateModel {
  GetStateModel({
    this.status,
    this.message,
  });

  int? status;
  Message? message;

  factory GetStateModel.fromJson(Map<String, dynamic> json) => GetStateModel(
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
    required this.state,
  });

  List<State> state;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    state: List<State>.from(json["state"].map((x) => State.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "state": List<dynamic>.from(state.map((x) => x.toJson())),
  };
}

class State {
  State({
    required this.stateId,
    required this.stateName,
    required this.countryId,
  });

  String stateId;
  String stateName;
  String countryId;

  factory State.fromJson(Map<String, dynamic> json) => State(
    stateId: json["STATE_ID"],
    stateName: json["STATE_NAME"],
    countryId: json["COUNTRY_ID"],
  );

  Map<String, dynamic> toJson() => {
    "STATE_ID": stateId,
    "STATE_NAME": stateName,
    "COUNTRY_ID": countryId,
  };
}
