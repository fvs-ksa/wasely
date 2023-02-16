import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasely/cubit/profile_cubit/state.dart';
import 'package:wasely/model/user_model.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';
import 'package:wasely/utils/shared_pref.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(InitialProfileState());
  static ProfileCubit get(context)=>BlocProvider.of(context);


  late ProfileModel profileModel;
  bool isInitialize=false;
   getProfileData(){
    emit(WaselyGetProfileLoadingState());
    DioHelper.getData(
      url: BaseUrl.getProfileData,
      token: CacheHelper.getData(key: 'access_token'),

    ).then((value){
      profileModel=ProfileModel.fromJson(value.data);
      print(profileModel);
      isInitialize=true;
      emit(WaselyGetProfileSuccessState());
    }).catchError((error){
      print('/////////////////eeeeeeeeeeeeeeeee///${error.toString()}rrrrrrrrrrrrrrrrrrr');
      emit(WaselyGetProfileErrorState(error: error.toString()));
    });
  }
}