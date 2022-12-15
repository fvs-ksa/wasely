import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/state.dart';
import 'package:wasely/utils/shared_pref.dart';

class GeneralCubit extends Cubit<GeneralState>{
  GeneralCubit():super(GeneralInitState());
  static GeneralCubit get(BuildContext context)=>BlocProvider.of(context);
  bool isRegister=true;
  void changeAuthState(){
    isRegister=!isRegister;
    emit(ChangeAuthState());
  }
  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 2));
    print('ready in 2...');

    print('go!');
    FlutterNativeSplash.remove();
    emit(NativeSplashState());
  }
  int indexTab=0;
  void changeIndexTab({required var value}){
    indexTab=value;
    print('object');
    emit(ChangeTabBarState());

  }
  bool isLastFirstBoarding = false;
  changeFirstBoarding(){
    isLastFirstBoarding=true;
    emit(ChangeFirstLastState());
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
    emit(GetCurrentAddressSuccessState());
  }
  void getUserCurrentLocation()async{
    emit(GetCurrentAddressLoadingState());
    await determinePosition().then((value)=>getPlace(value));
  }

}