import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLoading(
      {Key? key, this.width = double.infinity, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[300]!,
      baseColor: Colors.grey[400]!,
      child: Padding(
        padding:  EdgeInsets.all(10.0.sp),
        child: Container(
          height: 12.h,
          decoration: BoxDecoration(
              // border: Border.all(),
              // borderRadius: BorderRadius.circular(15),
              ),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 0.1.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 20.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      // shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .29,
                            // height:MediaQuery.of(context).size.height*.30 ,
                            height: 2.h,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .1,
                            // height:MediaQuery.of(context).size.height*.30 ,
                            height: 10.sp,
                            color: Colors.grey,
                          ),
                          // Text('${distance.toString()} كم')
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * .12,
                        // height:MediaQuery.of(context).size.height*.30 ,
                        height: 10.sp,
                        color: Colors.grey,
                      ),
                      //Text('  ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
