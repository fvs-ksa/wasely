import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';
import 'package:wasely/utils/shared_pref.dart';

import '../../model/login_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isRegister=true;
  void changeAuthState(){
    isRegister=!isRegister;
    emit(ChangeAuthState());
  }

  void userRegister(
      {required String name,
        required String email,
        required String phone,
        required String password}) {
    emit(WaselyLoadingRegisterAuthState());
    DioHelper.postData(url: BaseUrl.signUp, data: {
      'f_name': name,
      'email': email,
      'phone': '+966${phone}',
      'password': password,
    }).then((value) {
      print(value.data);
      print(value.data['token']);
      // if(token==null){
      //   print('object1');
      // }else
      // CacheHelper.saveDate(key: 'token', value: token);
      // print(token);
      emit(WaselySuccessRegisterAuthState());
    }).catchError((e) {
      print(e.toString());
      emit(WaselyErrorRegisterAuthState(error: e.toString()));
    });
  }
 late LoginModel loginModel;
  void userLogin(String phone, String password) {
    emit(WaselyAuthLoginLoadingState());
    DioHelper.postData(url: BaseUrl.signIn, data: {
      'phone': '+966$phone',
      'password': password,
    }).then((value) {
      print(value.data);
      print(value.data['token']);
      loginModel=  LoginModel.fromJson(value.data);
      print('/////////////////////////////////////${loginModel.token}');
      emit(WaselyAuthLoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(WaselyAuthLoginErrorState(error: error.toString()));
    });
  }
}
