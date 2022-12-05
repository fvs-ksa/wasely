import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'const_color.dart';

Widget textFormField(
    {required TextEditingController controller,
    int? number,
     Function? fct,
      Function? onchange,
     String? text,
      TextInputType? type,
    bool isenable = true,
    IconData? child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
    child: TextFormField(
      maxLength: number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
     enabled: isenable,
     onChanged: (v){
        return onchange!(v);
     },
     // obscureText: obsecure,
      validator: (s) {
        return fct!(s);
      },
      controller: controller,
      textDirection: TextDirection.rtl,
      keyboardType: type,
      decoration: InputDecoration(
          filled: true,
          //<-- SEE HERE
          // fillColor: Colors.deepPurpleAccent,
          fillColor: Colors.white,
          suffixIcon: Icon(child),

          hintTextDirection: TextDirection.rtl,
          // labelText: 'text',
          // labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),

          hintText: text,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          errorStyle: TextStyle(color: Colors.white),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    ),
  );
}

Widget headerContainer(
    {required BuildContext context,
    required String text,
    Widget? image,
    String secondText = ''}) {
  return Container(
    height: 290.sp,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: 250.sp,
            decoration: BoxDecoration(
                color: redColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(70))),
          ),
        ),
        Positioned(
            top: 50.sp,
            left: 0,
            child: Container(
              child: Center(
                  child: Text(
                text,
                // cubit.isRegister ? 'انشاء حساب' : 'تسجيل الدخول',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50.sp,
              color: amberColor,
            )),
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 228.0.sp, bottom: 75.sp),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 150.sp,
                    width: MediaQuery.of(context).size.width,
                    child: image,
                  ),
                ),
              ),
            ),
            Text(secondText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height:MediaQuery.of(context).size.height*.25 ,)
          ],
        )
      ],
    ),
  );
}
Widget mainButton({
  required double width,
  FontWeight? fontWeight,
  required String text,required Color color,required BuildContext context,required Function fct}){
  return InkWell(
    onTap: () {
      fct();
      // if (key.currentState!.validate()) {
      //   navigateAndReplacement(
      //       context: context, child: OtpScreen());
      // }
    },
    child: Container(
      height: 30.sp,
      width: width,
      child: Center(child: Text(
        text,
        // cubit.isRegister
        //     ? 'انشاء حساب'
        //     : 'ارسال كود تحقق',
        style: TextStyle(
            color: Colors.white,
            fontWeight: fontWeight,
            fontSize: 18),
      ),),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)),
    ),
  );
  // return TextButton(
  //   onPressed: () {},
  //   child: Text(
  //     text,
  //    // cubit.isRegister ? 'انشاء حساب' : 'ارسال كود تحقق',
  //     style: TextStyle(
  //         color: Colors.white,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 18),
  //   ),
  //   style: ButtonStyle(
  //       shape: MaterialStateProperty.all<
  //           RoundedRectangleBorder>(
  //           RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(25))),
  //       backgroundColor: MaterialStateProperty.all<Color>(
  //         color,
  //       )),
  // );
}
Widget containerOfDrawer({required Function fct,required String text,IconData? iconData}){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 18.0.sp),
    child: Container(
      height: 30.sp,
      child: InkWell(
        onTap: () {fct();},
        child: Row(
          children: [FaIcon(iconData,color: redColor,),
            SizedBox(width: 10.sp,),
            Text(text),

          ],
        ),
      ),
    ),
  );
}
Widget mainContainer({required BuildContext context,required Function fct,required ImageProvider image,
  String? address,
  String? status,
  required double heightMainContainer,
  required double heightSecondContainer,
  required double widthSecondContainer,
  double? distance,
  Color? color,
  String? title}){
  return Padding(
    padding:  EdgeInsets.all(10.0.sp),
    child: InkWell(
      onTap: () {
        fct();
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => CustomRestaurant()));
      },
      child: Container(
        height: heightMainContainer,
        decoration: BoxDecoration(
         // border: Border.all(),
         // borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 0.1.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: heightSecondContainer,
                width: widthSecondContainer,
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: image
                    )),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 2.h),
              child: Container(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width*.29,
                         // height:MediaQuery.of(context).size.height*.30 ,
                          child: Text(
                            title!,
                            style: TextStyle(
                               // fontWeight: FontWeight.w800,
                                fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(width: 13.w,),
                        Text('${distance.toString()} kms')
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Text(status!,style: TextStyle(color: color,fontSize: 15,fontWeight: FontWeight.w700),)

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


Widget mealsContainer({
  //required double mainHeight,required double secondHeight,
  required NetworkImage image,required String mealName,required double price}){
  return Padding(
    padding:  EdgeInsets.only(top: 8.0,left: 10.sp,right: 10.sp),
    child: Container(
        height: 28.h,
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
                height: 20.h,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: image,fit: BoxFit.cover,)
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mealName),
                    Text('${price} SAR'),
                  ],
                ),
              )
            ],
          ),

        )


    ),
  );
}


navigateTo({required BuildContext context,required Widget child}){
 return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => child));
}
navigateAndReplacement({required BuildContext context,required Widget child}){
  return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>child));
}
Widget notifiContainer(){
  return Container(
    height: 10.8.h,
      decoration: BoxDecoration(
      border: Border.all(),
  borderRadius: BorderRadius.circular(15),),
     child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 8.h,
              width: 17.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage('assets/app icon.png')
                  ),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 7.0.sp),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'لديك اشعار جديد',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp),
                  ),
                  // SizedBox(
                  //   width: 65.sp,
                  // ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text('تم قبول طلبك')
                  // SizedBox(
                  //   height: 15.sp,
                  // ),

                ],
              ),
            ),
          ),
        ],
      )
  );
}
