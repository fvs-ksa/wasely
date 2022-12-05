import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/cubit.dart';

class ItemBar extends StatelessWidget {
  late Color backgroundColor;

  late String title;
  late int indexItem;
  late Color textColor;
  ItemBar({required this.title,required this.indexItem});

  @override
  Widget build(BuildContext context) {
    backgroundColor = indexItem == GeneralCubit.get(context).indexTab
        ? redColor
        : Colors.white;
    textColor = indexItem == GeneralCubit.get(context).indexTab
        ? Colors.white
        : Colors.black;
    return Container(
      padding: EdgeInsets.only(bottom: 5.sp),
      margin: EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
          border: Border.all(color: Colors.white)
      ),
      width: MediaQuery.of(context).size.width * 0.28,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 16),
      ),
    );
  }
}
