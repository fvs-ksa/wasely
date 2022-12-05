import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PreviousOrder extends StatelessWidget {
  const PreviousOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 18.h,width: double.infinity/2,child: Image.asset('assets/restaurant.png')),
          SizedBox(height: 1.h,),
          Text('لا يوجد لديك طلبات سابقه',style: TextStyle(fontSize: 17.sp,),),
        ],
      ),
    );
  }
}