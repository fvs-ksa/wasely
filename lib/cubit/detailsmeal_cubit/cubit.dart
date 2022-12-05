

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:wasely/cubit/detailsmeal_cubit/state.dart';

class DetailMealsCubit extends Cubit<DetailsMealsState>{
  DetailMealsCubit():super(initialDetailMealsState());
  static DetailMealsCubit get(context)=>BlocProvider.of(context);
  int cartCount=0;
  int mealsCount=1;
  int mealsPrice=90;
  int total=90;
  changeCartCount(){
    cartCount++;
    emit(ChangeCartCountState());
  }
  incrementMealsCount(){
    mealsCount++;
    total=mealsCount*mealsPrice;
    emit(IncrementCountCartState());
  }
  decrementCartCount(){
    mealsCount--;
    total=mealsCount*mealsPrice;
    emit(DecrementCountCartState());
  }
  addToCart(){
    cartCount=mealsCount;
    emit(AddAmountToCartState());
  }
 late Position position;
  void getCurrentLocation()async{
    try{

       position = await GeolocatorPlatform.instance.getCurrentPosition();
      debugPrint('location:${position.longitude}');
      final coordinate=await placemarkFromCoordinates(position.latitude, position.longitude);
     // currentLocation=await Location().getLocation();
       var first = coordinate.first;
       print("${first.name} : ${first..administrativeArea}");
      print(position.longitude);
      emit(GetCurrentLocationSuccessState());
    }catch(e){
      print(e.toString());
      emit(GetCurrentLocationErrorState(e.toString()));
    }

  }
}