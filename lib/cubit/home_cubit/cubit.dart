import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasely/cubit/home_cubit/state.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';

import '../../component/const_color.dart';
import '../../model/get_banners.dart';
import '../../model/palce_location_model.dart';
import '../../model/restaurant_model.dart';
import '../../model/user_model.dart';
import '../../utils/shared_pref.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitialHomeState());
  static HomeCubit get(context)=>BlocProvider.of(context);



  List<RestaurantModel>shimmerList=[];
  bool isLoadingShimmer=false;

  Future<void> loadHomeData()async{
    isLoadingShimmer = true;
    emit(LoadingShimmerTrueState());
    await  Future.delayed(Duration(seconds: 3));
    shimmerList=List.of(restaurant);
    isLoadingShimmer=false;
    emit(LoadingShimmerFalseState());


  }
 

  late Position position;
  var first;
  bool isLoading = false;
  String? address;

  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location Service is disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Service are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permision are denied permanently, we cannot request permission');
    }
    return Geolocator.getCurrentPosition();
  }

  Future<void> getPlace(Position pos) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(
        pos.latitude, pos.longitude,
        localeIdentifier: 'ar');
    Placemark placeMark = newPlace[0];
    String name = placeMark.name.toString();
    String street = placeMark.street.toString();
    String subLocality = placeMark.subLocality.toString();
    String locality = placeMark.locality.toString();
    String postalCode = placeMark.postalCode.toString();
    String country = placeMark.country.toString();
    String administrativeArea = placeMark.administrativeArea.toString();
    address = subLocality +
        ',' +
        street +
        ',' +
        locality +
        ',' +
        postalCode +
        ',' +
        administrativeArea +
        ',' +
        country +
        ',' +
        name;
    isLoading = true;

    print(address);
    print(pos.latitude);
    print(pos.longitude);
    currentLocation = address.toString();

    //  CacheHelper.putData(key: 'address', value: currentLocation);
    emit(GetCurrentAddressSuccessState());
   // addAddress(address: address!, lat: pos.latitude, lng: pos.longitude);


  }

  void getUserCurrentLocation() async {
    emit(GetCurrentAddressLoadingState());
    await determinePosition().then((value) => getPlace(value));
    emit(GetPlaceSuccessState());
    //getBanners(zoneId: zone_ids);


  }

//   bool isAddAddress = false;
//  late UpdateAddressModel updateAddressModel;
//   void addAddress(
//       {required String address, required double lat, required double lng}) {
//     emit(AddAddressLoadingState());
//     DioHelper.postData(
//       url: BaseUrl.updateAddress,
//       data: {
//         'address': address,
//         'lat': lat,
//         // "token":'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9..ICxwqgPzAGyG0ZsaIqdhMdHrXNQ-BtB2Kf7JZ9C5UHaMjnKlnQ9QnJWCmKuGetaqwbVtBHd14MnWtSf-wp9CkgebDFoQdxElM',
//         'lon': lng,
//       },
//       token: CacheHelper.getData(key: 'access_token'),
//     ).then((value) {
//       // print(value.data);
//       // print(value.data['zone_ids']);
//       // zone_ids = value.data['zone_ids'];
//       isAddAddress = true;
//      // print(zone_ids);
// print(updateAddressModel.message);
//       emit(AddAddressSuccessState());
//      // getBanners(zoneId: zone_ids);
//     }).catchError((error) {
//       print(error.toString());
//       emit(AddAddressErrorState(error: error.toString()));
//     });
//   }
//   late GetBanners getBannersModel;
//   bool isBannersGet=false;
//   void getBanners({required var zoneId}) {
//     emit(GetBannersLoadingState());
//     DioHelper.getData(
//         url: BaseUrl.getBanners,
//         // token: CacheHelper.getData(key: 'token'),
//       //  zone: zone_ids
//     )
//         .then((value) {
//       print(value.data);
//       getBannersModel=GetBanners.fromJson(value.data);
//       print(getBannersModel.banners![0].image);
//       isBannersGet=true;
//       emit(GetBannersSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetBannersErrorState(error: error.toString()));
//     });
//   }
  // void postAddress(){
  //   DioHelper.postData(url: BaseUrl.addAddress, data: {
  //
  //   })
  // }
  void arabicTextField({required TextEditingController controller}){
    if(controller.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length -1))){
      // setState(() {
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
      // });
      emit(ArabicTextFieldAuthState());
    }
  }
 // late ProfileModel profileModel;
  // void getProfileData(){
  //   emit(WaselyGetProfileLoadingState());
  //   DioHelper.getData(
  //     url: BaseUrl.getProfileData,
  //     token: token,
  //
  //   ).then((value){
  //     profileModel=ProfileModel.fromJson(value.data);
  //     print(profileModel.message);
  //     emit(WaselyGetProfileSuccessState());
  //   }).catchError((error){
  //     print('/ggggggggggggggggggggg ${error.toString()}?????????????????????????');
  //     emit(WaselyGetProfileErrorState(error: error.toString()));
  //   });
  // }
}