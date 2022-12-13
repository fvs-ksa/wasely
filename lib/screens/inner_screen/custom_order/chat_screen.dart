import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wasely/component/const_color.dart';

class ChatScreen extends StatelessWidget {
  int index;
  String phone;
  String image;
  String name;

  ChatScreen(
      {Key? key, required this.index, required this.phone, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(

          preferredSize: Size.fromHeight(15.h), child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
                color: redColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 25.sp,
                      backgroundImage: NetworkImage(image),
                    ),
                    SizedBox(width: 3.w,),
                    Text(name, style: TextStyle(fontSize: 15.sp,
                        color: Colors.white),),
                  ],),
                  IconButton(onPressed: () async {
                    await launchUrlString('tel:${phone}');
                  }, icon: FaIcon(FontAwesomeIcons.phone, color: Colors.white,))
                ],
              ),
            ),
          ),
        ),
        ),
        body:Column(),
        bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom,
        right: 5.w,
          left: 5.w
        ), child: Container(
          height: 12.h,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: Row(
            children: [
              FloatingActionButton(onPressed: (){},child: FaIcon(FontAwesomeIcons.paperPlane,color: Colors.white,),),
              SizedBox(width: 3.w,),
              Expanded(child: TextFormField(
                decoration: InputDecoration(hintText: 'رساله',
                    hintStyle: TextStyle(color: redColor,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: redColor))),
              )),


            ],
          ),
        ),),
      ),
    );
  }
}
