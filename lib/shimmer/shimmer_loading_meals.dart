import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerLoadingMeals extends StatelessWidget {
  const ShimmerLoadingMeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 10.sp, right: 10.sp),
        child: Container(
            height: 26.h,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(color: Colors.grey,width: 4.w,height: 2.h,),
                        Container(color: Colors.grey,width: 4.w,height: 2.h,),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      highlightColor: Colors.grey[300]!,
      baseColor: Colors.grey[400]!,
    );
  }
}
