import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/screens/auth_screen/otp_screen.dart';

import '../../component/component.dart';
import '../../cubit/state.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    var cubit = GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                headerContainer(
                  context: context,
                  text: cubit.isRegister ? 'انشاء حساب' : 'تسجيل الدخول',
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: cubit.isRegister ? 40.h : 30.h,
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
                          cubit.isRegister
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
                          SizedBox(
                            height: 1.h,
                          ),
                          mainButton(
                              width: 50.w,
                              text: cubit.isRegister
                                  ? 'انشاء حساب'
                                  : 'ارسال كود تحقق',
                              color: amberColor,
                              context: context,
                              fct: () {
                                if (key.currentState!.validate()) {
                                  navigateAndReplacement(
                                      context: context, child: OtpScreen());
                                }
                              }),
                          SizedBox(
                            height: 5.sp,
                          ),
                          TextButton(
                              onPressed: () {
                                cubit.changeAuthState();
                              },
                              child: Text(
                                cubit.isRegister
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
