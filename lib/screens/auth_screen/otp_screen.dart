import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';

import '../../component/component.dart';
import '../../cubit/state.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                // Container(
                //   height: 290.sp,
                //   child: Stack(
                //     alignment: Alignment.bottomCenter,
                //     children: [
                //       Align(
                //         alignment: AlignmentDirectional.topCenter,
                //         child: Container(
                //           height: 250.sp,
                //           decoration:  BoxDecoration(
                //               color: redColor,
                //               borderRadius: BorderRadius.only(
                //                   bottomRight: Radius.circular(70))),
                //         ),
                //       ),
                //       Positioned(
                //           top: 50.sp,
                //           left: 0,
                //           child: Container(
                //             child: Center(
                //                 child: Text(
                //               cubit.isRegister ? 'انشاء حساب' : 'تسجيل الدخول',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold),
                //             )),
                //             width: MediaQuery.of(context).size.width * 0.9,
                //             height: 50.sp,
                //             color: amberColor,
                //           )),
                //       Container(
                //         height: 100.sp,
                //         width: 120.sp,
                //         child: Image.asset('assets/images/ima.jpg'),
                //       )
                //     ],
                //   ),
                // ),
                headerContainer(
                  context: context,
                  text:  'جاري ارسال كود تحقق',
                ),
                SizedBox(
                  height: 40.sp,
                ),
                Container(
                  height: 200.sp,
                  width: 250.sp,
                  decoration: BoxDecoration(
                      color: redColor, borderRadius: BorderRadius.circular(17)),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.sp,
                        ),


                        OTPTextField(
                          length: 4,
                          width: MediaQuery.of(context).size.width * .85,
                          otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white),
                          fieldWidth: 50,
                        //  spaceBetween: 5.sp,

                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontSize: 17),
                          onCompleted: (v){
                            if(v.isEmpty){
                               'من فضلك ادخل الكود المكون من 4 ارقام';
                            }
                          },
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                         // obscureText: true,
                        ),

                        SizedBox(
                          height: 19.sp,
                        ),
                        mainButton(width: 120.sp,text: ' تحقق', color: amberColor, context: context, fct: () {
                          if (key.currentState!.validate()) {
                            navigateAndReplacement(context: context, child: HomeScreen());
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
