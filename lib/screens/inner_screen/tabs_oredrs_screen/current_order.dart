import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';

class CurrentOrder extends StatelessWidget {
  const CurrentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 10.0.sp,left: 14,right: 14),
          child: Container(
            height: 15.h,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ماكدونالد',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Text('طلب رقم 112#',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w800),),

                  Divider(
                    endIndent: 5.sp,
                    thickness: 2,
                    indent: 5.sp,
                  ),

                //  SizedBox(height: .5.h,),
                  Center(
                    //padding:  EdgeInsets.only(right: 48.0.sp),
                    child: Text('تم الاتفاق مع السائق',style: TextStyle(color: redColor,fontSize: 12.sp),),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
