// To parse this JSON data, do
//
//     final getCurrentBalanceModel = getCurrentBalanceModelFromJson(jsonString);

import 'dart:convert';

GetCurrentBalanceModel getCurrentBalanceModelFromJson(String str) => GetCurrentBalanceModel.fromJson(json.decode(str));

String getCurrentBalanceModelToJson(GetCurrentBalanceModel data) => json.encode(data.toJson());

class GetCurrentBalanceModel {
  GetCurrentBalanceModel({
    required this.status,
    required this.balance,
  });

  int status;
  String balance;

  factory GetCurrentBalanceModel.fromJson(Map<String, dynamic> json) => GetCurrentBalanceModel(
    status: json["status"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "balance": balance,
  };
}
