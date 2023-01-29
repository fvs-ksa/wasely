// class PlaceLocation{
//   double latitue;
//   double longitude;
//   String address;
//   PlaceLocation({required this.address,required this.latitue,required this.longitude});
// }
// class UpdateAddressModel {
//   int? status;
//   String? message;
//
//   UpdateAddressModel({this.status, this.message});
//
//   UpdateAddressModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     return data;
//   }
// }