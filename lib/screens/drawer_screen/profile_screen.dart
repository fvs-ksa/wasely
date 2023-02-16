import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/profile_cubit/cubit.dart';
import 'package:wasely/cubit/profile_cubit/state.dart';
import 'package:wasely/model/user_model.dart';
import 'package:wasely/screens/auth_screen/login_screen.dart';
import 'package:wasely/utils/shared_pref.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var profileCubit = ProfileCubit.get(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // if(profileCubit.profileModel.account!.fname!.isEmpty){
          //   Center(
          //     child: CircularProgressIndicator.adaptive(),
          //   );
          // }
        },
        builder: (context, state) {
          TextEditingController nameController = TextEditingController(
              text: profileCubit.profileModel.account!.firstName);
          TextEditingController phoneController = TextEditingController(
              text: profileCubit.profileModel.account!.phone);
          return  Scaffold(
            appBar: AppBar(
              title: Text('حسابي'),
            ),
            body:Padding(
              padding: EdgeInsets.only(top: 8.0.sp),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                       // profileCubit.profileModel.account!.image,

                         'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'
                      ),
                      radius: 45.sp,
                    ),
                  ),
                  textFormField(controller: nameController, isenable: false),
                  textFormField(controller: phoneController, isenable: false),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.sp)),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'تسجيل خروج',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height > 1000
                                              ? 9.sp
                                              : 13.sp),
                                    ),
                                    SizedBox(
                                      height: 1.2.h,
                                    ),
                                    Text('هل انت متاكد من تسجيل الخروج ؟'),
                                    SizedBox(
                                      height: 1.3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        mainButton(
                                            width: 30.w,
                                            buttonColor: redColor,
                                            textColor: Colors.white,
                                            borderColor: redColor,
                                            text: 'نعم',
                                            color: redColor,
                                            context: context,
                                            fct: () {
                                              CacheHelper.removeData(
                                                      key: 'access_token')
                                                  .then((value) {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()),
                                                    (route) => false);
                                              });
                                            }),
                                        SizedBox(
                                          width: 1.8.w,
                                        ),
                                        mainButton(
                                            width: 30.w,
                                            borderColor: redColor,
                                            textColor: Colors.black,
                                            text: 'لا',
                                            color: redColor,
                                            context: context,
                                            fct: () {
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تسجيل الخروج',
                          style: TextStyle(color: amberColor, fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        FaIcon(
                          FontAwesomeIcons.signOut,
                          color: amberColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () {
                      CacheHelper.removeData(key: 'token').then((value) {
                        if (value) {
                          navigateTo(context: context, child: LoginScreen());
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'حذف الحساب',
                          style: TextStyle(color: redColor, fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        FaIcon(
                          FontAwesomeIcons.x,
                          color: redColor,
                        ),
                      ],
                    ),
                  ),
                  // Text('جلال'),
                  // Text('+996506977241')
                ],
              ),
            ),
          );
        });
  }
}
