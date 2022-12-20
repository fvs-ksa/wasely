import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasely/cubit/home_cubit/state.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';

import '../../model/restaurant_model.dart';

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
  // void postAddress(){
  //   DioHelper.postData(url: BaseUrl.addAddress, data: {
  //
  //   })
  // }
}