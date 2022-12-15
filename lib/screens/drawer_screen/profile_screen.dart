import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';

class ProfileScreen extends StatelessWidget {

TextEditingController nameController=TextEditingController(text: 'جلال');
  TextEditingController phoneController=TextEditingController(text: '966506977241+');
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('حسابي'),),
        body: Padding(
          padding:  EdgeInsets.only(top: 8.0.sp),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                  radius: 45.sp,
                ),
              ),
              textFormField(controller: nameController, isenable: false),
              textFormField(controller: phoneController, isenable: false),
             SizedBox(height: 5.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('تسجيل الخروج',style: TextStyle(color: amberColor,fontSize: 14.sp),),
                 SizedBox(width: 1.w,),
                 FaIcon(FontAwesomeIcons.signOut,color: amberColor,),
               ],
             ),SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('حذف الحساب',style: TextStyle(color: redColor,fontSize: 14.sp),),
                  SizedBox(width: 1.w,),
                  FaIcon(FontAwesomeIcons.x,color: redColor,),
                ],
              ),
             // Text('جلال'),
             // Text('+996506977241')
            ],
          ),
        ),
      ),
    );
  }
}
