import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasely/cubit/all_meals_cubit/state.dart';
import 'package:wasely/model/restaurant_model.dart';

class AllMealsCubit extends Cubit<AllMealsState>{
  AllMealsCubit():super(InitialAllMealState());
  static AllMealsCubit get(context)=>BlocProvider.of(context);
  bool isLoadingShimmer=false;
  List<RestaurantModel>shimmerList=[];

  Future<void> loadAllMealsShimmerData()async{
    isLoadingShimmer = true;
    emit(LoadingShimmerTrueState());
    await  Future.delayed(Duration(seconds: 4));
    shimmerList=List.of(restaurant);
    isLoadingShimmer=false;
    emit(LoadingShimmerFalseState());


  }

}