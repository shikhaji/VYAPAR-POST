class ProfileContantModel {
  int? status;
  Message? message;

  ProfileContantModel({this.status, this.message});

  ProfileContantModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  List<Category>? category;
  Profile? profile;

  Message({this.category, this.profile});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? vendorId;
  String? brandName;
  String? status;
  String? date;
  String? brandImage;

  Category(
      {this.id,
        this.vendorId,
        this.brandName,
        this.status,
        this.date,
        this.brandImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandName = json['brand_name'];
    status = json['status'];
    date = json['date'];
    brandImage = json['brand_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_name'] = this.brandName;
    data['status'] = this.status;
    data['date'] = this.date;
    data['brand_image'] = this.brandImage;
    return data;
  }
}

class Profile {
  String? bRANCHID;
  String? fIRMID;
  String? bRANCHNAME;
  String? bRANCHCODE;
  String? bRANCHADDRESS;
  String? bRANCHSTATE;
  String? bRANCHCITY;
  String? bRANCHCONTACT;
  String? bRANCHPHONE;
  String? bRANCHEMAIL;
  String? bRANCHTARGET;
  String? bRANCHCREATED;
  String? bRANCHTT;
  String? bRANCHUSERNAME;
  String? bRANCHPASSWORD;
  String? bRANCHSTATUS;
  String? cOMPANYHRMTYPE;
  String? pARENTID;
  String? pARENTTYPE;
  String? sPONSERID;
  String? uPPERID;
  String? sTARTDATE;
  String? bRANCHVIEWPASSWORD;
  String? cATEGORYID;
  String? bRANCHKYCSTATUS;
  String? sPONSERNAME;

  Profile(
      {this.bRANCHID,
        this.fIRMID,
        this.bRANCHNAME,
        this.bRANCHCODE,
        this.bRANCHADDRESS,
        this.bRANCHSTATE,
        this.bRANCHCITY,
        this.bRANCHCONTACT,
        this.bRANCHPHONE,
        this.bRANCHEMAIL,
        this.bRANCHTARGET,
        this.bRANCHCREATED,
        this.bRANCHTT,
        this.bRANCHUSERNAME,
        this.bRANCHPASSWORD,
        this.bRANCHSTATUS,
        this.cOMPANYHRMTYPE,
        this.pARENTID,
        this.pARENTTYPE,
        this.sPONSERID,
        this.uPPERID,
        this.sTARTDATE,
        this.bRANCHVIEWPASSWORD,
        this.cATEGORYID,
        this.bRANCHKYCSTATUS,
        this.sPONSERNAME});

  Profile.fromJson(Map<String, dynamic> json) {
    bRANCHID = json['BRANCH_ID'];
    fIRMID = json['FIRM_ID'];
    bRANCHNAME = json['BRANCH_NAME'];
    bRANCHCODE = json['BRANCH_CODE'];
    bRANCHADDRESS = json['BRANCH_ADDRESS'];
    bRANCHSTATE = json['BRANCH_STATE'];
    bRANCHCITY = json['BRANCH_CITY'];
    bRANCHCONTACT = json['BRANCH_CONTACT'];
    bRANCHPHONE = json['BRANCH_PHONE'];
    bRANCHEMAIL = json['BRANCH_EMAIL'];
    bRANCHTARGET = json['BRANCH_TARGET'];
    bRANCHCREATED = json['BRANCH_CREATED'];
    bRANCHTT = json['BRANCH_TT'];
    bRANCHUSERNAME = json['BRANCH_USERNAME'];
    bRANCHPASSWORD = json['BRANCH_PASSWORD'];
    bRANCHSTATUS = json['BRANCH_STATUS'];
    cOMPANYHRMTYPE = json['COMPANY_HRM_TYPE'];
    pARENTID = json['PARENT_ID'];
    pARENTTYPE = json['PARENT_TYPE'];
    sPONSERID = json['SPONSER_ID'];
    uPPERID = json['UPPER_ID'];
    sTARTDATE = json['START_DATE'];
    bRANCHVIEWPASSWORD = json['BRANCH_VIEW_PASSWORD'];
    cATEGORYID = json['CATEGORY_ID'];
    bRANCHKYCSTATUS = json['BRANCH_KYC_STATUS'];
    sPONSERNAME = json['SPONSER_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BRANCH_ID'] = this.bRANCHID;
    data['FIRM_ID'] = this.fIRMID;
    data['BRANCH_NAME'] = this.bRANCHNAME;
    data['BRANCH_CODE'] = this.bRANCHCODE;
    data['BRANCH_ADDRESS'] = this.bRANCHADDRESS;
    data['BRANCH_STATE'] = this.bRANCHSTATE;
    data['BRANCH_CITY'] = this.bRANCHCITY;
    data['BRANCH_CONTACT'] = this.bRANCHCONTACT;
    data['BRANCH_PHONE'] = this.bRANCHPHONE;
    data['BRANCH_EMAIL'] = this.bRANCHEMAIL;
    data['BRANCH_TARGET'] = this.bRANCHTARGET;
    data['BRANCH_CREATED'] = this.bRANCHCREATED;
    data['BRANCH_TT'] = this.bRANCHTT;
    data['BRANCH_USERNAME'] = this.bRANCHUSERNAME;
    data['BRANCH_PASSWORD'] = this.bRANCHPASSWORD;
    data['BRANCH_STATUS'] = this.bRANCHSTATUS;
    data['COMPANY_HRM_TYPE'] = this.cOMPANYHRMTYPE;
    data['PARENT_ID'] = this.pARENTID;
    data['PARENT_TYPE'] = this.pARENTTYPE;
    data['SPONSER_ID'] = this.sPONSERID;
    data['UPPER_ID'] = this.uPPERID;
    data['START_DATE'] = this.sTARTDATE;
    data['BRANCH_VIEW_PASSWORD'] = this.bRANCHVIEWPASSWORD;
    data['CATEGORY_ID'] = this.cATEGORYID;
    data['BRANCH_KYC_STATUS'] = this.bRANCHKYCSTATUS;
    data['SPONSER_NAME'] = this.sPONSERNAME;
    return data;
  }
}