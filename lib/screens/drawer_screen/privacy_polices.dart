import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/cubit/terms_and_aboutus_cubit/state.dart';

import '../../cubit/terms_and_aboutus_cubit/cubit.dart';

class PrivacyPolicesScreen extends StatelessWidget {
  const PrivacyPolicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TermsAndAboutUsCubit.get(context);
    return BlocConsumer<TermsAndAboutUsCubit, TermsAndAboutUsState>(
        listener: (context, state) {
      // if(state is !GetTermsSuccessState){
      //  print('object');
      // }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('سياسه الخصوصيه'),
        ),
        body: cubit.isGetTerms
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0.sp,
                  vertical: 10.sp,
                ),
                child: Column(
                  children: [
                    Text(cubit.termsModel.appSettings!.terms,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  ],
                ),
              )
            : state is GetTermsErrorState
                ? Align(
                    alignment: Alignment.center,
                    child: Text('يوجد مشكله بالاتصال',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),))
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      );
    });
  }
}
