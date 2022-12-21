import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerCarouselLoading extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerCarouselLoading(
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
          height: 20.h,
          decoration: BoxDecoration(
              color: Colors.grey,
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),

        ),
      ),
    );
  }
}
