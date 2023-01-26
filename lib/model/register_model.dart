// // class RegisterModel {
// //   RegisterModel({
// //     required this.status,
// //     required this.message,
// //     required this.account,
// //   });
// //   late final int status;
// //   late final String message;
// //    Account? account;
// //
// //   RegisterModel.fromJson(Map<String, dynamic> json){
// //     status = json['status'];
// //     message = json['message'];
// //     account =json['account']!=null? Account.fromJson(json['account']):null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final _data = <String, dynamic>{};
// //     _data['status'] = status;
// //     _data['message'] = message;
// //   //  _data['account'] = account.toJson();
// //     return _data;
// //   }
// // }
// //
// // class Account {
// //   Account({
// //     required this.fname,
// //     required this.lname,
// //     required this.email,
// //     required this.password,
// //     required this.phone,
// //     required this.isActive,
// //     required this.isVerified,
// //     required this.updatedAt,
// //     required this.createdAt,
// //     required this.id,
// //   });
// //
// //   late final String fname;
// //   late final String lname;
// //   late final String email;
// //   late final String password;
// //   late final String phone;
// //   late final int isActive;
// //   late final int isVerified;
// //   late final String updatedAt;
// //   late final String createdAt;
// //   late final int id;
// //
// //   Account.fromJson(Map<String, dynamic> json){
// //     fname = json['fname'];
// //     lname = json['lname'];
// //     email = json['email'];
// //     password = json['password'];
// //     phone = json['phone'];
// //     isActive = json['is_active'];
// //     isVerified = json['is_verified'];
// //     updatedAt = json['updated_at'];
// //     createdAt = json['created_at'];
// //     id = json['id'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final _data = <String, dynamic>{};
// //     _data['fname'] = fname;
// //     _data['lname'] = lname;
// //     _data['email'] = email;
// //     _data['password'] = password;
// //     _data['phone'] = phone;
// //     _data['is_active'] = isActive;
// //     _data['is_verified'] = isVerified;
// //     _data['updated_at'] = updatedAt;
// //     _data['created_at'] = createdAt;
// //     _data['id'] = id;
// //     return _data;
// //   }
// // }
//
// class RegisterModel {
//   late int status;
//   late String message;
//   UserData? userData;
//   RegisterModel.fromJson(Map<String,dynamic>json){
//     status=json['status'];
//     message=json['message'];
//     userData=json['account'];
//   }
//
// }
//
// class UserData {
//   late int id;
//   late String firstName;
//   late String lastName;
//   late String email;
//   late String phone;
//   late int isActive;
//   late int isVerified;
//
//   UserData(
//       {required this.id, required this.lastName, required this.phone, required this.email,
//         required this.firstName, required this.isActive, required this.isVerified,});
//
//
//
//   UserData.fromJson(Map<String, dynamic>json){
//     id = json['id'];
//     lastName = json['lname'];
//     firstName = json['fname'];
//     email = json['email'];
//     phone = json['phone'];
//     isActive = json['is_active'];
//     isVerified = json['is_verified'];
//   }
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['fname'] = firstName;
//     _data['lname'] = lastName;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['is_active'] = isActive;
//     _data['is_verified'] = isVerified;
//     _data['is_active'] = isActive;
//     _data['is_verified'] = isVerified;
//     _data['id'] = id;
//     return _data;
//   }
//
//
// }
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
  String? fname;
  String? lname;
  String? email;
  String? password;
  String? phone;
  int? isActive;
  int? isVerified;
  String? updatedAt;
  String? createdAt;
  int? id;

  Account(
      {this.fname,
        this.lname,
        this.email,
        this.password,
        this.phone,
        this.isActive,
        this.isVerified,
        this.updatedAt,
        this.createdAt,
        this.id});

  Account.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}