class OtpModel {
  int? status;
  String? message;
  Account? account;

  OtpModel({this.status, this.message, this.account});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}

class Account {
  int? id;
  String? fname;
  String? lname;
  String? phone;
//  Null? address;
  String? email;
  // Null? image;
  // Null? fcm;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  int? isVerified;
  String? gender;
  int? totalRate;

  Account(
      {this.id,
        this.fname,
        this.lname,
        this.phone,
        // this.address,
        // this.email,
        // this.image,
        // this.fcm,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.isVerified,
        this.gender,
        this.totalRate});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
   // address = json['address'];
    email = json['email'];
  //  image = json['image'];
   // fcm = json['fcm'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    gender = json['gender'];
    totalRate = json['total_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
  //  data['address'] = this.address;
    data['email'] = this.email;
  //  data['image'] = this.image;
  //  data['fcm'] = this.fcm;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['gender'] = this.gender;
    data['total_rate'] = this.totalRate;
    return data;
  }
}