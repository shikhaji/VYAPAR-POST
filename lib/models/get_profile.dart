import 'dart:convert';

GetProfile getProfileFromJson(String str) => GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class GetProfile {
  GetProfile({
    this.status,
    this.balance,
  });

  int? status;
  List<Balance> ?balance;

  factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
    status: json["status"],
    balance: List<Balance>.from(json["balance"].map((x) => Balance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "balance": List<dynamic>.from(balance!.map((x) => x.toJson())),
  };
}

class Balance {
  Balance({
    this.profileId,
    this.profileTt,
    this.orgName,
    this.orgEmail,
    this.orgAltEmail,
    this.orgPhone,
    this.orgAltPhone,
    this.orgAddress,
    this.keyId,
    this.keySecret,
    this.appUrl,
    this.singleNotice,
    this.orgAbout,
    this.orgPrivacyPolicy,
    this.orgTermsConditionShortDesc,
    this.orgTermsConditions2,
    this.referalAmount,
  });

  String? profileId;
  DateTime? profileTt;
  String? orgName;
  String? orgEmail;
  String? orgAltEmail;
  String? orgPhone;
  String? orgAltPhone;
  String? orgAddress;
  String? keyId;
  String? keySecret;
  String? appUrl;
  String? singleNotice;
  String? orgAbout;
  String? orgPrivacyPolicy;
  String? orgTermsConditionShortDesc;
  String? orgTermsConditions2;
  String? referalAmount;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
    profileId: json["PROFILE_ID"],
    profileTt: DateTime.parse(json["PROFILE_TT"]),
    orgName: json["ORG_NAME"],
    orgEmail: json["ORG_EMAIL"],
    orgAltEmail: json["ORG_ALT_EMAIL"],
    orgPhone: json["ORG_PHONE"],
    orgAltPhone: json["ORG_ALT_PHONE"],
    orgAddress: json["ORG_ADDRESS"],
    keyId: json["KEY_ID"],
    keySecret: json["KEY_SECRET"],
    appUrl: json["APP_URL"],
    singleNotice: json["SINGLE_NOTICE"],
    orgAbout: json["ORG_ABOUT"],
    orgPrivacyPolicy: json["ORG_PRIVACY_POLICY"],
    orgTermsConditionShortDesc: json["ORG_TERMS_CONDITION_SHORT_DESC"],
    orgTermsConditions2: json["ORG_TERMS_CONDITIONS_2"],
    referalAmount: json["REFERAL_AMOUNT"],
  );

  Map<String, dynamic> toJson() => {
    "PROFILE_ID": profileId,
    "ORG_NAME": orgName,
    "ORG_EMAIL": orgEmail,
    "ORG_ALT_EMAIL": orgAltEmail,
    "ORG_PHONE": orgPhone,
    "ORG_ALT_PHONE": orgAltPhone,
    "ORG_ADDRESS": orgAddress,
    "KEY_ID": keyId,
    "KEY_SECRET": keySecret,
    "APP_URL": appUrl,
    "SINGLE_NOTICE": singleNotice,
    "ORG_ABOUT": orgAbout,
    "ORG_PRIVACY_POLICY": orgPrivacyPolicy,
    "ORG_TERMS_CONDITION_SHORT_DESC": orgTermsConditionShortDesc,
    "ORG_TERMS_CONDITIONS_2": orgTermsConditions2,
    "REFERAL_AMOUNT": referalAmount,
  };
}
