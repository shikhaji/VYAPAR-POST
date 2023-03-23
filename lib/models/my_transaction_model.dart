// To parse this JSON data, do
//
//     final myTransactionModel = myTransactionModelFromJson(jsonString);

import 'dart:convert';

MyTransactionModel myTransactionModelFromJson(String str) => MyTransactionModel.fromJson(json.decode(str));

String myTransactionModelToJson(MyTransactionModel data) => json.encode(data.toJson());

class MyTransactionModel {
  MyTransactionModel({
    required this.status,
    required this.message,
  });

  int status;
  Message message;

  factory MyTransactionModel.fromJson(Map<String, dynamic> json) => MyTransactionModel(
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
    required this.transaction,
  });

  List<Transaction> transaction;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    transaction: List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
  };
}

class Transaction {
  Transaction({
    required this.cwtId,
    required this.cwtCustomerId,
    required this.cwtTransactionId,
    required this.cwtAmount,
    required this.cwtDate,
    required this.cwtTt,
    required this.cwtPaymentType,
    required this.cwtStatus,
    required this.cwtPaymentStatus,
    required this.cwtContestId,
    this.paymentTypeId,
    this.paymentTt,
    this.paymentName,
  });

  String cwtId;
  String cwtCustomerId;
  String cwtTransactionId;
  String cwtAmount;
  DateTime cwtDate;
  DateTime cwtTt;
  String cwtPaymentType;
  String cwtStatus;
  String cwtPaymentStatus;
  String cwtContestId;
  dynamic paymentTypeId;
  dynamic paymentTt;
  dynamic paymentName;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    cwtId: json["CWT_ID"],
    cwtCustomerId: json["CWT_CUSTOMER_ID"],
    cwtTransactionId: json["CWT_TRANSACTION_ID"],
    cwtAmount: json["CWT_AMOUNT"],
    cwtDate: DateTime.parse(json["CWT_DATE"]),
    cwtTt: DateTime.parse(json["CWT_TT"]),
    cwtPaymentType: json["CWT_PAYMENT_TYPE"],
    cwtStatus: json["CWT_STATUS"],
    cwtPaymentStatus: json["CWT_PAYMENT_STATUS"],
    cwtContestId: json["CWT_CONTEST_ID"],
    paymentTypeId: json["PAYMENT_TYPE_ID"],
    paymentTt: json["PAYMENT_TT"],
    paymentName: json["PAYMENT_NAME"],
  );

  Map<String, dynamic> toJson() => {
    "CWT_ID": cwtId,
    "CWT_CUSTOMER_ID": cwtCustomerId,
    "CWT_TRANSACTION_ID": cwtTransactionId,
    "CWT_AMOUNT": cwtAmount,
    "CWT_DATE": "${cwtDate.year.toString().padLeft(4, '0')}-${cwtDate.month.toString().padLeft(2, '0')}-${cwtDate.day.toString().padLeft(2, '0')}",
    "CWT_TT": cwtTt.toIso8601String(),
    "CWT_PAYMENT_TYPE": cwtPaymentType,
    "CWT_STATUS": cwtStatus,
    "CWT_PAYMENT_STATUS": cwtPaymentStatus,
    "CWT_CONTEST_ID": cwtContestId,
    "PAYMENT_TYPE_ID": paymentTypeId,
    "PAYMENT_TT": paymentTt,
    "PAYMENT_NAME": paymentName,
  };
}
