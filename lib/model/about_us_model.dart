class AboutUsModel {
  int? status;
  String? message;
  AppSettings? appSettings;

  AboutUsModel({this.status, this.message, this.appSettings});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    appSettings = json['app_settings'] != null
        ? new AppSettings.fromJson(json['app_settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.appSettings != null) {
      data['app_settings'] = this.appSettings!.toJson();
    }
    return data;
  }
}

class AppSettings {
  String? aboutUs;

  AppSettings({this.aboutUs});

  AppSettings.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_us'] = this.aboutUs;
    return data;
  }
}