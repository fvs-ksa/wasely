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
            height: 175.sp,
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
                    // padding: EdgeInsets.all(8),
                    height: 130.sp,

                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),

                      //image: DecorationImage(image: image,fit: BoxFit.cover,)
                    ),
                  ),
                  //SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(color: Colors.grey,width: 20.sp,height: 10.sp,),
                        Container(color: Colors.grey,width: 20.sp,height: 10.sp,),
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
