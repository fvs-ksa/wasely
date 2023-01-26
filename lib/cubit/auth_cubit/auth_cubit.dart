import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasely/model/otp_model.dart';
import 'package:wasely/model/register_model.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';
import 'package:wasely/utils/shared_pref.dart';

import '../../model/login_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isRegister = true;

  void changeAuthState() {
    isRegister = !isRegister;
    emit(ChangeAuthState());
  }

  late RegisterModel registerModel;

  void userRegister(
      {required String name,
      required String email,
      required String phone,
        required String lastName,
      required String password}) {
    emit(WaselyLoadingRegisterAuthState());
    DioHelper.postData(url: BaseUrl.signUp, data: {
      'fname': name,
      'lname':lastName ,
      'password': password,
      'phone': '${phone}',
      "email":email,
    }).then((value) {
      //  print(value.data);
      // print(value.data['token']);
      registerModel = RegisterModel.fromJson(value.data);
     // print(value.data);
    print('#################### ${registerModel.message} #####################');
      print('#################### ${registerModel.status} #####################');
      print('#################### ${registerModel.account!.email} #####################');
      // if(token==null){
      //   print('object1');
      // }else
      // CacheHelper.saveData(key: 'token', value: registerModel.account!.);
      // print(token);
      emit(WaselySuccessRegisterAuthState());
      OtpCodeMethod(phone: phone);
    }).catchError((e) {
      print(e.toString());
      emit(WaselyErrorRegisterAuthState(error: e.toString()));
    });
  }

 late LoginModel loginModel;

  void userLogin(String phone, String password) {
    emit(WaselyAuthLoginLoadingState());
    DioHelper.postData(url: BaseUrl.signIn, data: {
      'phone': phone,
      'password': password,
    }).then((value) {
      // print(value.data['access_token']);
      // print(value.data);
      // print(value.data['token']);
      loginModel=  LoginModel.fromJson(value.data);

      emit(WaselyAuthLoginSuccessState(loginModel: loginModel));

      print(loginModel.message);
      print('/////////////////////////////////////${loginModel.accessToken} ????????????????????');
      if(loginModel.accessToken==null){
        print('object1');
      }else{
        CacheHelper.saveData(key: 'access_token', value:loginModel.accessToken);
        token=loginModel.accessToken;
        print('Galal $token');
      }

    }).catchError((error) {
      print(error.toString());
      emit(WaselyAuthLoginErrorState(error: error.toString()));
    });
  }
  late OtpModel otpModel;
  void OtpCodeMethod({required String phone}){
    emit(WaselyAuthSendOtpLoadingState());
    DioHelper.postData(url: BaseUrl.sentOtp, data: {
      'code':1234,
      'phone':phone,
    }).then((value) {
      print(value.data);
      otpModel=OtpModel.fromJson(value.data);
      emit(WaselyAuthSendOtpSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(WaselyAuthSendOtpErrorState(error: e.toString()));
    });
  }
}
