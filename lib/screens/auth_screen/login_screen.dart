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
  TextEditingController lastNameController = TextEditingController();

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
              key: 'access_token', value: authCubit.loginModel.accessToken).then((value){
            // authCubit
            token=authCubit.loginModel.accessToken;
            navigateAndReplacement(
                context: context, child: OtpScreen(phone: phoneController.text,));
            print('///////////////${authCubit.loginModel.accessToken} ////////////////////////////852');


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
                  text: authCubit.isRegister ? 'انشاء حساب' : 'تسجيل الدخول',
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
                                      return 'من فضلك قم بادخال الاسم';
                                    }
                                  },
                                  text: 'الاسم',
                                )
                              : Container(),

                          authCubit.isRegister
                              ? textFormField(
                              number: 10,
                              type: TextInputType.emailAddress,
                              controller: lastNameController,
                              fct: (var value) {
                                if (value.isEmpty) {
                                  return 'رقم الجوال يجب الا يقل عن 10 ارثام';
                                }
                              },
                              text: 'الاسم الاخير',
                              child: Icons.person)
                              : Container(),
                          textFormField(
                              number: 10,
                              type: TextInputType.phone,
                              controller: phoneController,
                              fct: (var value) {
                                if (value.isEmpty || value.length < 10) {
                                  return 'رقم الجوال يجب الا يقل عن 10 ارثام';
                                }
                              },
                              text: '05xxxxxxxx',
                              child: Icons.call),

                          authCubit.isRegister
                              ? textFormField(
                                  number: 10,
                                  type: TextInputType.emailAddress,
                                  controller: emailController,
                                  fct: (var value) {
                                    if (value.isEmpty) {
                                      return 'رقم الجوال يجب الا يقل عن 10 ارثام';
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
                                  return 'رقم الجوال يجب الا يقل عن 10 ارثام';
                                }
                              },
                              text: '********',
                              child: Icons.lock),
                          mainButton(
                              width: 50.w,
                              text: authCubit.isRegister
                                  ? 'انشاء حساب'
                                  : 'ارسال كود تحقق',
                              color: amberColor,
                              context: context,
                              fct: ()  {
                                if (key.currentState!.validate()) {
                                  //navigateTo(context: context, child: OtpScreen());
                                  if(authCubit.isRegister==true){

                                      authCubit.userRegister(
                                          name: nameController.text,
                                          email: emailController.text,
                                          lastName: lastNameController.text,
                                          phone: phoneController.text,
                                          password: passwordController.text);
                                      navigateAndReplacement(context: context, child: OtpScreen(phone: phoneController.text,));


                                  }else{
                                      authCubit.userLogin(
                                          phoneController.text,
                                          passwordController.text);
                                      navigateAndReplacement(context: context, child: OtpScreen(phone: phoneController.text,));


                                  }
                                  // authCubit.isRegister
                                  //     ? authCubit.userRegister(
                                  //         name: nameController.text,
                                  //         email: emailController.text,
                                  //         lastName: lastNameController.text,
                                  //         phone: phoneController.text,
                                  //         password: passwordController.text);
                                  //
                                  //     :

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
                                    ? 'لدي حساب بالفعل؟ تسجيل دخول'
                                    : 'ليس لدي حساب؟ انشاء حساب',
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
