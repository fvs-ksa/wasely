import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/auth_cubit/auth_cubit.dart';
import 'package:wasely/cubit/auth_cubit/auth_state.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';

import '../../component/component.dart';
import '../../cubit/state.dart';

class OtpScreen extends StatefulWidget {
  String phone;
  OtpScreen({required this.phone});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                headerContainer(
                  context: context,
                  text: 'جاري ارسال كود تحقق',
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 28.h,
                  width: 74.w,
                  decoration: BoxDecoration(
                      color: redColor, borderRadius: BorderRadius.circular(17)),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        OTPTextField(
                          length: 4,
                          width: MediaQuery.of(context).size.width * .85,
                          otpFieldStyle:
                              OtpFieldStyle(backgroundColor: Colors.white),
                          fieldWidth: 50,
                          //  spaceBetween: 5.sp,

                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontSize: 15.sp),
                          onCompleted: (v) {
                            if (v.isEmpty) {
                              'من فضلك ادخل الكود المكون من 4 ارقام';
                            }
                          },
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        mainButton(
                            width: 50.w,
                            textColor: whiteColor,
                            buttonColor: amberColor,
                            text: ' تحقق',
                            color: amberColor,
                            context: context,
                            fct: () {
                              if (key.currentState!.validate()) {

                                navigateAndReplacement(
                                    context: context, child: HomeScreen());
                              }
                            }),
                      ],
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
