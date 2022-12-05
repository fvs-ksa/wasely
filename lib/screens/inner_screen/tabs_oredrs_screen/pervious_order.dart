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
          Container(height: 100.sp,width: double.infinity/2,child: Image.asset('assets/restaurant.png')),
          SizedBox(height: 10.sp,),
          Text('لا يوجد لديك طلبات سابقه',style: TextStyle(fontSize: 25,),),
        ],
      ),
    );
  }
}