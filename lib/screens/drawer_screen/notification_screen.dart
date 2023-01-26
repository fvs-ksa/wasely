import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاشعارات'),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 1.0.h,right: 4.w,left: 4.w,bottom: 2.h),
        child: Column(
          children: [
            notifyContainer(),
          ],
        ),
      ),
    );
  }
}
