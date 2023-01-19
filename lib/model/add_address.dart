// class AddAddressModel {
//   String? message;
//   List<int>? zone_ids;
//
//   AddAddressModel({required this.message, required this.zone_ids});
//
//   AddAddressModel.fromJson(Map<String, dynamic> json){
//     message = json['message'];
//     zone_ids = json['zone_ids'] ;
//       //  == null ? null : List<int>.from(
//         // json['zone_ids'].map((e) => e.fromJson(e)));
//   }
//
//   Map<String, dynamic> toJson() =>
//       {
//         'message': message,
//         'zone_ids': zone_ids
//             // == null ? null : List<int>.from(
//             // zone_ids!.map((e) => e.toInt()))
//       };
// }