import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/auth_cubit/auth_cubit.dart';
import 'package:wasely/cubit/auth_cubit/auth_state.dart';

import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/model/login_model.dart';
import 'package:wasely/screens/auth_screen/otp_screen.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/utils/shared_pref.dart';

import '../../component/component.dart';
import '../../cubit/state.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    //  var registerCubit = RegisterCubit.get(context);
    //  var loginCubit=LoginCubit.get(context);
    var authCubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is WaselyAuthLoginSuccessState||state is WaselyLoadingRegisterAuthState){
          CacheHelper.saveData(
              key: 'token', value: authCubit.loginModel.token).then((value){
            token=authCubit.loginModel.token;
            navigateAndReplacement(
                context: context, child: OtpScreen());
            print('///////////////${authCubit.loginModel.token}');

            // print('token');
            // // .then((value) {
            // // if(value){
            // // // print('TOKEN://////////////////// $token');

          });
          //  }

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                headerContainer(
                  context: context,
                  text: authCubit.isRegister ? '?????????? ????????' : '?????????? ????????????',
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: authCubit.isRegister ? 40.h : 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: redColor, borderRadius: BorderRadius.circular(17)),
                  child: Form(
                    key: key,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          authCubit.isRegister
                              ? textFormField(
                                  child: Icons.person,
                                  controller: nameController,
                                  fct: (value) {
                                    if (value.isEmpty) {
                                      return '???? ???????? ???? ???????????? ??????????';
                                    }
                                  },
                                  text: '??????????',
                                )
                              : Container(),
                          textFormField(
                              number: 9,
                              type: TextInputType.phone,
                              controller: phoneController,
                              fct: (var value) {
                                if (value.isEmpty || value.length < 9) {
                                  return '?????? ???????????? ?????? ?????? ?????? ???? 10 ??????????';
                                }
                              },
                              text: '5xxxxxxxx',
                              child: Icons.call),
                          SizedBox(
                            height: 1.h,
                          ),
                          authCubit.isRegister
                              ? textFormField(
                                  number: 10,
                                  type: TextInputType.emailAddress,
                                  controller: emailController,
                                  fct: (var value) {
                                    if (value.isEmpty) {
                                      return '?????? ???????????? ?????? ?????? ?????? ???? 10 ??????????';
                                    }
                                  },
                                  text: 'wasely@wasely.com',
                                  child: Icons.call)
                              : Container(),
                          textFormField(
                              number: 10,
                              //  type: TextInputType.phone,
                              controller: passwordController,
                              fct: (var value) {
                                if (value.isEmpty) {
                                  return '?????? ???????????? ?????? ?????? ?????? ???? 10 ??????????';
                                }
                              },
                              text: '********',
                              child: Icons.call),
                          mainButton(
                              width: 50.w,
                              text: authCubit.isRegister
                                  ? '?????????? ????????'
                                  : '?????????? ?????? ????????',
                              color: amberColor,
                              context: context,
                              fct: ()  {
                                if (key.currentState!.validate()) {
                                  authCubit.isRegister
                                      ? authCubit.userRegister(
                                          name: nameController.text,
                                          email: emailController.text,
                                          phone: phoneController.text,
                                          password: passwordController.text)
                                      :
                                  authCubit.userLogin(
                                          phoneController.text,
                                          passwordController.text);
                                  // if (token == null) {
                                  //   print('object');
                                  // } else {
                                  // if(state is WaselyAuthLoginLoadingState ||state is WaselyLoadingRegisterAuthState){
                                  //   print('object');
                                  // }else{



                                    // }
                                    //
                                    //   });
                                 // }
                                }
                              }),
                          SizedBox(
                            height: 5.sp,
                          ),
                          TextButton(
                              onPressed: () {
                                authCubit.changeAuthState();
                              },
                              child: Text(
                                authCubit.isRegister
                                    ? '?????? ???????? ?????????????? ?????????? ????????'
                                    : '?????? ?????? ?????????? ?????????? ????????',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
