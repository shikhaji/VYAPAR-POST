class GetAllPostByCategoryModel {
  int? status;
  Message? message;

  GetAllPostByCategoryModel({this.status, this.message});

  GetAllPostByCategoryModel.fromJson(Map<String, dynamic> json) {
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
  List<AllPostByCat>? allPost;

  Message({this.allPost});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['all_post'] != null) {
      allPost = <AllPostByCat>[];
      json['all_post'].forEach((v) {
        allPost!.add(new AllPostByCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allPost != null) {
      data['all_post'] = this.allPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllPostByCat {
  String? vAPID;
  String? vAPTT;
  String? vAPLOGINID;
  String? vAPTITLE;
  String? vAPDESC;
  String? vAPVIDEOTYPE;
  String? vAPIMAGE;
  String? vAPVIDEOURL;
  String? vAPLIKE;
  String? vAPCOMMENT;
  int? vAPLIKESTATUS;
  String? bRANCHID;
  String? bRANCHPHOTO;
  String? bRANCHCONTACT;
  String? bRANCHEMAIL;

  AllPostByCat(
      {this.vAPID,
        this.vAPTT,
        this.vAPLOGINID,
        this.vAPTITLE,
        this.vAPDESC,
        this.vAPVIDEOTYPE,
        this.vAPIMAGE,
        this.vAPVIDEOURL,
        this.vAPLIKE,
        this.vAPCOMMENT,
        this.vAPLIKESTATUS,
        this.bRANCHID,
        this.bRANCHPHOTO,
        this.bRANCHCONTACT,
        this.bRANCHEMAIL});

  AllPostByCat.fromJson(Map<String, dynamic> json) {
    vAPID = json['VAP_ID'];
    vAPTT = json['VAP_TT'];
    vAPLOGINID = json['VAP_LOGIN_ID'];
    vAPTITLE = json['VAP_TITLE'];
    vAPDESC = json['VAP_DESC'];
    vAPVIDEOTYPE = json['VAP_VIDEO_TYPE'];
    vAPIMAGE = json['VAP_IMAGE'];
    vAPVIDEOURL = json['VAP_VIDEO_URL'];
    vAPLIKE = json['VAP_LIKE'];
    vAPCOMMENT = json['VAP_COMMENT'];
    vAPLIKESTATUS = json['VAP_LIKE_STATUS'];
    bRANCHID = json['BRANCH_ID'];
    bRANCHPHOTO = json['BRANCH_PHOTO'];
    bRANCHCONTACT = json['BRANCH_CONTACT'];
    bRANCHEMAIL = json['BRANCH_EMAIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VAP_ID'] = this.vAPID;
    data['VAP_TT'] = this.vAPTT;
    data['VAP_LOGIN_ID'] = this.vAPLOGINID;
    data['VAP_TITLE'] = this.vAPTITLE;
    data['VAP_DESC'] = this.vAPDESC;
    data['VAP_VIDEO_TYPE'] = this.vAPVIDEOTYPE;
    data['VAP_IMAGE'] = this.vAPIMAGE;
    data['VAP_VIDEO_URL'] = this.vAPVIDEOURL;
    data['VAP_LIKE'] = this.vAPLIKE;
    data['VAP_COMMENT'] = this.vAPCOMMENT;
    data['VAP_LIKE_STATUS'] = this.vAPLIKESTATUS;
    data['BRANCH_ID'] = this.bRANCHID;
    data['BRANCH_PHOTO'] = this.bRANCHPHOTO;
    data['BRANCH_CONTACT'] = this.bRANCHCONTACT;
    data['BRANCH_EMAIL'] = this.bRANCHEMAIL;
    return data;
  }
}