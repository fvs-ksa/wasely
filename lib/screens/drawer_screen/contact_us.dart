import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';

class ContactUs extends StatelessWidget {
 final TextEditingController contactUsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تواصل معانا',style: TextStyle(fontFamily: 'jannah'),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: TextFormField(
                controller: contactUsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'اكتب مشكلتك هنا',
                ),
                maxLines: 10,
              ),
            ),
            mainButton(
              width: 120.sp,
              text: 'ارسال مشكلتك',
              color: redColor,
              context: context,
              fct: () {},
            ),

          ],
        ),
      ),
    );
  }
}
