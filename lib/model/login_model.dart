class LoginModel{
  String? token;
  LoginModel({required this.token});
  LoginModel.fromJson(Map<String,dynamic> json)  {
  token=json['token'];

  }
}
