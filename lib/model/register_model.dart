class RegisterModel {
  int? status;
  String? message;
  Account? account;

  RegisterModel({this.status, this.message, this.account});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? phone;
  String? type;
  int? isVerified;
  int? isActive;
  // Null? image;
  // Null? address;
  // Null? points;
  // Null? balance;
  // Null? deviceToken;

  Account(
      {this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.type,
        this.isVerified,
        this.isActive,
        // this.image,
        // this.address,
        // this.points,
        // this.balance,
        // this.deviceToken
      });

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first name'];
    lastName = json['last name'];
    phone = json['phone'];
    type = json['type'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    // image = json['image'];
    // address = json['address'];
    // points = json['points'];
    // balance = json['balance'];
    // deviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first name'] = this.firstName;
    data['last name'] = this.lastName;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    // data['image'] = this.image;
    // data['address'] = this.address;
    // data['points'] = this.points;
    // data['balance'] = this.balance;
    // data['device_token'] = this.deviceToken;
    return data;
  }
}