import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الاشعارات'),
        ),
        body: Padding(
          padding:  EdgeInsets.only(top: 18.0.sp,right: 15.sp,left: 15.sp,bottom: 7.sp),
          child: Column(
            children: [
              notifiContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
