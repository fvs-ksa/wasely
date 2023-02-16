class TermsModel {
  int? status;
  String? message;
  AppSettings? appSettings;

  TermsModel({this.status, this.message, this.appSettings});

  TermsModel.fromJson(Map<String, dynamic> json) {
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
  late String terms;

  AppSettings({required this.terms});

  AppSettings.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms'] = this.terms;
    return data;
  }
}