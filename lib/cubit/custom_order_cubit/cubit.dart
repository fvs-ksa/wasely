

import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wasely/cubit/custom_order_cubit/state.dart';
import 'package:wasely/model/driver_offer_model.dart';
import 'package:wasely/model/user_model.dart';

import '../../component/const_color.dart';
import '../../utils/shared_pref.dart';

class CustomOrderCubit extends Cubit<CustomOrderState>{
  CustomOrderCubit():super(InitialCustomOrderState());
  static CustomOrderCubit get(context)=>BlocProvider.of(context);

  File? file;
  bool pickImage=false;
  pickCameraImage(BuildContext context)async{
    final XFile? pickedFile=await ImagePicker().pickImage(source: ImageSource.camera);
    file=(File(pickedFile!.path));
    pickImage=true;
    emit(PickCameraImageCustomOrderState());
    Navigator.pop(context);
  }
  pickGalleryImage(BuildContext context)async{
    final XFile? pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
    file=(File(pickedFile!.path));
    pickImage=true;
    emit(PickGalleryImageCustomOrderState());
   Navigator.pop(context);
  }
  clearImage(){
    pickImage=false;
    emit(ClearImageCustomOrderState());
  }
  String payType='Cash';
  bool changeValueMada = false;
  bool changeValueApple = true;
  changeCashPayValue({var value}){
    if(changeValueApple= true)
    changeValueApple = value;
    changeValueMada = false;
    payType = 'Cash';
    emit(ChangePayCashOrderState());

  }
  changeCreditPayValue({var value}){
    if (changeValueMada = true) {
      changeValueMada = value;
      changeValueApple = false;
      payType = 'credit';
      emit(ChangePayCreditOrderState());
    }

  }

  void arabicTextField({required TextEditingController controller}){
    if(controller.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length -1))){
      // setState(() {
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
      // });
      emit(ArabicTextFieldAuthState());
    }
  }

  late Position position;
  var first;
  bool isLoading=false;
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

  void getPlace(Position pos) async {

    List<Placemark> newPlace =
    await placemarkFromCoordinates(pos.latitude, pos.longitude,localeIdentifier: 'ar');
    Placemark placeMark = newPlace[0];
    String name = placeMark.name.toString();
    String street = placeMark.street.toString();
    String subLocality = placeMark.subLocality.toString();
    String locality = placeMark.locality.toString();
    String postalCode=placeMark.postalCode.toString();
    String country=placeMark.country.toString();
    String administrativeArea=placeMark.administrativeArea.toString();
    address=subLocality+','+street+','+locality+','+postalCode+','+administrativeArea+','+country+','+name;
    isLoading=true;

    print(address);
    currentLocation=address.toString();
    CacheHelper.putData(key: 'address', value: currentLocation);
    emit(GetCurrentAddressForCustomOrderSuccessState());
  }
  void getUserCurrentLocation()async{
    emit(GetCurrentAddressForCustomOrderLoadingState());
    await determinePosition().then((value)=>getPlace(value));
  }
static List<DriverOfferModel> driver=[];



  Stream<List<DriverOfferModel>?> generateNumbers = (() async* {
    await Future<void>.delayed(Duration(seconds: 5));

    driver=List.of(driverOffer);

    yield driver;
    // for (int i = 1; i <= 5; i++) {
    //
    //   await Future<void>.delayed(Duration(seconds: 4));
    //
    //   print(i);
    //   print(driver[i].price);
    //   yield driver;
    // }
  } )();

  Future<List<DriverOfferModel>> generateNumbers1 ()async{
    await Future<void>.delayed(Duration(seconds: 5));

    driver=List.of(driverOffer);

    return driver;
  }
  // = (() async* {
  //
  //   // for (int i = 1; i <= 5; i++) {
  //   //
  //   //   await Future<void>.delayed(Duration(seconds: 4));
  //   //
  //   //   print(i);
  //   //   print(driver[i].price);
  //   //   yield driver;
  //   // }
  // } )();



  // void cancelStream(){
  //   generateNumbers.
  // }
}