import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/cubit/custom_order_cubit/cubit.dart';
import 'package:wasely/cubit/custom_order_cubit/state.dart';
import '../utils/navigation_services.dart';
import 'const_color.dart';

Widget textFormField(
    {required TextEditingController controller,
    int? number,
    Function? fct,
    Function? onchange,
    String? text,
      int? limtedNumber,
      Function? onTap,
    TextInputType? type,
    bool isenable = true,
      int? maxLines,
    IconData? child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
    child: TextFormField(
      maxLines: maxLines,
      onTap: (){
        onTap!();
      },
      maxLength: number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(limtedNumber),
      ],
      enabled: isenable,
      onChanged: (v) {
        return onchange!(v);
      },
      validator: (s) {
        return fct!(s);
      },
      controller: controller,
      textDirection: TextDirection.rtl,
      keyboardType: type,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(child),
          hintTextDirection: TextDirection.rtl,
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
            Text(
              secondText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
            )
          ],
        )
      ],
    ),
  );
}

Widget mainButton(
    {required double width,
    FontWeight? fontWeight,
    required String text,
    required Color color,
      Color? buttonColor,
      Color? borderColor,
      Color? textColor,
    required BuildContext context,
    required Function fct}) {
  return InkWell(
    onTap: () {
      fct();
    },
    child: Container(

      height: 30.sp,
      width: width,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: fontWeight, fontSize: 18),
        ),
      ),
      decoration:
          BoxDecoration(
              border: Border.all(color:borderColor??Colors.transparent ),
              color: buttonColor, borderRadius: BorderRadius.circular(15)),
    ),
  );
}
navigateForward(Widget page, {arguments}) {
  NavigationService.navigate().navigateToScreen(page, arguments: arguments);

}
navigateForwardReplace(Widget page, {arguments}) {
  NavigationService.navigate().replaceScreen(page, arguments: arguments);

}
navigateForwardPop(Widget page, {arguments}) {
  NavigationService.navigate().goBack(page);

}
Widget containerOfDrawer(
    {required Function fct, required String text, IconData? iconData,required BuildContext context}) {
  Size size=MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
    child: Container(
      height: 30.sp,
      child: InkWell(
        onTap: () {
          fct();
        },
        child: Row(
          children: [
            FaIcon(
              iconData,
              color: redColor,
              size:size.height>1000?12.sp:12.sp ,
            ),
            SizedBox(
              width: 10.sp,
            ),
            Text(text,style: TextStyle(fontSize: size.height>1000?9.sp: 12.sp),),
          ],
        ),
      ),
    ),
  );
}

Widget mainContainer(
    {required BuildContext context,
    required Function fct,
    required ImageProvider image,
    String? address,
    String? status,
    required double heightMainContainer,
    required double heightSecondContainer,
    required double widthSecondContainer,
    double? distance,
    Color? color,
    String? title}) {
  Size size=MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.all(10.0.sp),
    child: InkWell(
      onTap: () {
        fct();
      },
      child: Container(
        height: heightMainContainer,
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: heightSecondContainer,
                width: widthSecondContainer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:
                        DecorationImage(fit: BoxFit.fitHeight, image: image)),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .29,
                          child: Text(
                            title!,
                            style: TextStyle(
                                // fontWeight: FontWeight.w800,
                                fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text('${distance.toString()} kms',style: TextStyle(fontSize:size.height>1000?9.sp: 8.sp ,),)
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      status!,
                      style: TextStyle(
                          color: color,
                          fontSize:size.height>1000?9.sp: 8.sp ,
                          fontWeight: FontWeight.w700),
                    )
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

showLoaderDialog({required BuildContext context}) {
  AlertDialog alertDialog = AlertDialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 100.sp),
    content: Builder(builder: (context) {
      return Container(
        height: 50.sp,
        child: Center(child: CircularProgressIndicator()),
      );
    }),
  );
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      });
}

Widget text({required String title}) {
  return Align(
    alignment: Alignment.topRight,
    child: Text(
      title,
      style: TextStyle(
        color: redColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget payWidget(
  context,
) {
  return BlocConsumer<CustomOrderCubit, CustomOrderState>(
    listener: (context, state) {},
    builder: (context, state) {
      return StatefulBuilder(
          builder: (context, setState) => Directionality(
                textDirection: TextDirection.rtl,
                child: CupertinoActionSheet(
                  message: const Text('اختار طريقه الدفع'),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    side: BorderSide(style: BorderStyle.solid),
                                    value: CustomOrderCubit.get(context)
                                        .changeValueApple,
                                    onChanged: (value) {
                                      CustomOrderCubit.get(context)
                                          .changeCashPayValue(value: value);
                                    }),
                                Text('كاش'),
                              ],
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        print('object');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    side: BorderSide(style: BorderStyle.solid),
                                    value: CustomOrderCubit.get(context)
                                        .changeValueMada,
                                    onChanged: (value) {
                                      CustomOrderCubit.get(context)
                                          .changeCreditPayValue(value: value);
                                    }),
                                Text('Credit Card'),
                              ],
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        print('2');
                      },
                    ),
                  ],
                ),
              ));
    },
  );
}

Widget mealsContainer(
    {required NetworkImage image,
    required String mealName,
    required double price}) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0, left: 10.sp, right: 10.sp),
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
                height: 20.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
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
        )),
  );
}

navigateTo({required BuildContext context, required Widget child}) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => child));
}

navigateAndReplacement({required BuildContext context, required Widget child}) {
  return Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => child));
}

Widget notifyContainer() {
  return Container(
      height: 11.9.h,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
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
                  image: AssetImage('assets/app icon.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7.0.sp),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'لديك اشعار جديد',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text('تم قبول طلبك'),
                ],
              ),
            ),
          ),
        ],
      ));
}
void showToast({required String text,required ToastState state})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseColor(state),
    textColor: Colors.white,
    fontSize: 16.0.sp
);
enum ToastState{SUCCESS,WARNING,ERROR}
Color chooseColor(ToastState state){
  Color color;
  switch (state)
  {
    case ToastState.ERROR:
      color=Colors.red;
      break;
    case ToastState.SUCCESS:color=Colors.green;
    break;
    case ToastState.WARNING:color=yellowColor;
    break;

  }
  return color;
}
