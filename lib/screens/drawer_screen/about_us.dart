import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../cubit/terms_and_aboutus_cubit/cubit.dart';
import '../../cubit/terms_and_aboutus_cubit/state.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=TermsAndAboutUsCubit.get(context);
    return BlocConsumer<TermsAndAboutUsCubit, TermsAndAboutUsState>(
      listener: (context,state){},
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('عن وصلي'),
          ),
          body:cubit.isGetAboutUs? Padding(
            padding: EdgeInsets.symmetric(vertical: 18.sp),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_Wasly.png',
                    height: 150.sp,

                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0.sp),
                    child: Text(cubit.aboutUsModel.appSettings!.aboutUs??"",
                      style:
                          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                  ),

                ],
              ),
            ),
          ):state is GetAboutUsErrorState
              ? Align(
              alignment: Alignment.center,
              child: Text('يوجد مشكله بالاتصال',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),))
              : Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}
