// // class LoginModel{
// //   String? token;
// //   LoginModel({required this.token});
// //   LoginModel.fromJson(Map<String,dynamic> json)  {
// //   token=json['token'];
// //
// //   }
// // }
// class LoginModel {
//
//   late   int status;
//   late String message;
//  late  User user;
//   late String accessToken;
//  // late final String tokenType;
//     LoginModel({
//       required this.status,
//       required this.message,
//       //  required this.user,
//       required this.accessToken,
//       //   required this.tokenType,
//     });
//   LoginModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     user = User.fromJson(json['user']);
//     accessToken = json['access_token'];
//    // tokenType = json['token_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['user'] = user.toJson();
//     _data['access_token'] = accessToken;
//   //  _data['token_type'] = tokenType;
//     return _data;
//   }
// }
//
// class User {
//   User({
//     required this.id,
//     required this.fname,
//     required this.lname,
//     required this.phone,
//     //this.address,
//     required this.email,
//    // this.image,
//   //  this.fcm,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isActive,
//     required this.isVerified,
//    // this.gender,
//     required this.totalRate,
//   });
//   late final int id;
//   late final String fname;
//   late final String lname;
//   late final String phone;
//  // late final Null address;
//   late final String email;
// //  late final Null image;
//  // late final Null fcm;
//   late final String createdAt;
//   late final String updatedAt;
//   late final int isActive;
//   late final int isVerified;
//  // late final Null gender;
//   late final int totalRate;
//
//   User.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     fname = json['fname'];
//     lname = json['lname'];
//     phone = json['phone'];
//    // address = null;
//     email = json['email'];
//   //  image = null;
//   //  fcm = null;
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isActive = json['is_active'];
//     isVerified = json['is_verified'];
//    // gender = null;
//     totalRate = json['total_rate'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['fname'] = fname;
//     _data['lname'] = lname;
//     _data['phone'] = phone;
//   //  _data['address'] = address;
//     _data['email'] = email;
//    // _data['image'] = image;
//   //  _data['fcm'] = fcm;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['is_active'] = isActive;
//     _data['is_verified'] = isVerified;
//    // _data['gender'] = gender;
//     _data['total_rate'] = totalRate;
//     return _data;
//   }
// }
class LoginModel {
  int? status;
  String? message;
  User? user;
  String? accessToken;
  String? tokenType;

  LoginModel(
      {this.status, this.message, this.user, this.accessToken, this.tokenType});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  int? id;
  String? fname;
  String? lname;
  String? phone;
  Null? address;
  String? email;
  String? image;
  Null? fcm;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  int? isVerified;
  Null? gender;
  int? totalRate;

  User(
      {this.id,
        this.fname,
        this.lname,
        this.phone,
        this.address,
        this.email,
        this.image,
        this.fcm,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.isVerified,
        this.gender,
        this.totalRate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    image = json['image'];
    fcm = json['fcm'];
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
    data['address'] = this.address;
    data['email'] = this.email;
    data['image'] = this.image;
    data['fcm'] = this.fcm;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['gender'] = this.gender;
    data['total_rate'] = this.totalRate;
    return data;
  }
}