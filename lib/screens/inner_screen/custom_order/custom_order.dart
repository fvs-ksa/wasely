import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/state.dart';
import '../../../component/component.dart';
import '../../../cubit/custom_order_cubit/cubit.dart';
import '../../../cubit/custom_order_cubit/state.dart';
import 'driver_offer.dart';
class CustomOrderScreen extends StatelessWidget {
   CustomOrderScreen({Key? key}) : super(key: key);
  TextEditingController orderDetailsController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final key = GlobalKey<FormState>();
    var customOrderCubit = CustomOrderCubit.get(context);
   // var generalCubit = GeneralCubit.get(context);
    return BlocConsumer<CustomOrderCubit, CustomOrderState>(
      listener: (context, state) {
        if (state is GetCurrentAddressForCustomOrderLoadingState) {
          return showLoaderDialog(context: context);
        } else if (state is GetCurrentAddressForCustomOrderSuccessState) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        return BlocConsumer<GeneralCubit, GeneralState>(
          listener: (context, state) {},
          builder: (context, state) {
            return GestureDetector(
              onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: AppBar(title: Text('جب لي'),),
                body: SingleChildScrollView(
                  child: Form(
                    key: key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.6.w, vertical: 2.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          text(title: 'تفاصيل طلبك'),
                          TextFormField(
                            onTap: (){
                              customOrderCubit.arabicTextField(controller: orderDetailsController);
                            },
                            controller: orderDetailsController,
                            validator: (var value) {
                              if (value!.isEmpty) {
                                return 'تفاصيل طلبك مهمه النا';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'اطلب هنا',
                            ),
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          text(title: 'اضافه صوره'),
                          SizedBox(
                            height: 1.h,
                          ),
                          customOrderCubit.pickImage
                              ? Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 20.h,
                                  width: 40.w,
                                  // decoration: BoxDecoration(border: Border.all(color: redColor)),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        child: Container(
                                          height: 16.h,
                                          width: 33.w,
                                          decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.green),
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    customOrderCubit.file!,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Positioned(
                                        top: 1.h,
                                        left: 1.5.w,
                                        child: GestureDetector(
                                          onTap: () {
                                            customOrderCubit.clearImage();
                                          },
                                          child: CircleAvatar(
                                              radius: 10.sp,
                                              backgroundColor: redColor,
                                              child: FaIcon(
                                                FontAwesomeIcons.remove,
                                                color: Colors.white,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                              : GestureDetector(
                            onTap: () {
                              showCupertinoDialog(barrierDismissible: true,context: context, builder: (context){
                                return AlertDialog(
                                  content: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            customOrderCubit.pickCameraImage(context);
                                          },
                                          child: Row(children:[
                                            FaIcon(FontAwesomeIcons.camera,color: redColor,),
                                            SizedBox(width: 2.w,),
                                            Text('الكاميرا'),
                                          ]),
                                        ),
                                        SizedBox(height: 2.5.w,),
                                        GestureDetector(
                                          onTap: (){
                                            customOrderCubit.pickGalleryImage(context);
                                          },
                                          child: Row(children:[
                                            FaIcon(FontAwesomeIcons.image,color: amberColor,),
                                            SizedBox(width: 2.w,),
                                            Text('معرض الصور'),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                             // customOrderCubit.pickCameraImage();
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 16.h,
                                width: 33.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),

                          text(title: 'طريقه الدفع'),
                          InkWell(
                            onTap: (){
                              showCupertinoModalPopup(context: context, builder: (context)=>payWidget(context));
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Card(
                                elevation: 3,
                                child: Container(
                                  height: 7.h,

                                  // color: Colors.redAccent,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 7.0.sp),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Text('${cubit.total}SAR'),
                                        // SizedBox(width: 30.sp,),
                                        Icon(Icons.wallet_outlined),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(customOrderCubit.payType=='credit'?'بطاقه بنكيه':'كاش'),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Row(
                                          children: [
                                            Text('تغيير'),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 13,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: redColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          text(title: 'الموقع'),
                          GestureDetector(
                            onTap: () {
                              customOrderCubit.getUserCurrentLocation();
                            },
                            child: TextFormField(
                               // controller: locationController,
                              enabled: false,
                              // validator: (val) {
                              //   if (val!.isEmpty) {
                              //     return 'يجب عليك تحديد موقعك';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  label: Text('${currentLocation}',overflow: TextOverflow.ellipsis,),
                                  icon: Icon(Icons.location_on)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'مبلغ التوصيل المتوقع',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '20 ّّ~ 24 ر.س',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:size.height>800?size.height>1100?10.h:8.h: 2.0.h),
                            child: mainButton(
                              width: 120.sp,
                              text: 'رفع الطلب',
                              color: redColor,
                              context: context,
                              fct: () {
                                if (currentLocation.isEmpty) {
                                  Fluttertoast.showToast(msg: 'من فضلك اختار الموقع',backgroundColor: amberColor,toastLength: Toast.LENGTH_LONG,fontSize: 14.sp);
                                }else if (key.currentState!.validate()) {
                                  navigateTo(context: context, child: DriverOfferScreen());
                                }

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

