import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/order_details_cubit/cubit.dart';
import 'package:wasely/cubit/order_details_cubit/state.dart';
import '../../../../component/component.dart';

class OrderDetails extends StatelessWidget {
  //const OrderDetails({Key? key}) : super(key: key);
  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    var cubit = OrderDetailsCubit.get(context);
    Size size=MediaQuery.of(context).size;
    print(size.height);
    return BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {
      // if(state is GetCurrentLocOrderDetailsLoadingState){
      //   return  showLoaderDialog(context: context);
      // }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('تفاصيل طلبك'),
        ),
        body: state is GetCurrentLocOrderDetailsLoadingState ||
                state is AddDriverMarkerState
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.h),
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.w),
                        height:size.height>1000?MediaQuery.of(context).size.height*0.22: MediaQuery.of(context).size.height*0.21,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10.sp,
                                  child: Center(
                                    child: Text('1',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp, )),
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Text('تم تلقي طلبك',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp, )),
                              ],
                            ),

                           SizedBox(height: 2.5.w,),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10.sp,
                                  child: Center(
                                    child: Text('2',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp, )),
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Text('تم تلقي طلبك',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp, )),
                              ],
                            ),

                            SizedBox(height: 2.5.w,),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10.sp,
                                  child: Center(
                                    child: Text('3',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp, )),
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Text('تم تلقي طلبك',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp, )),
                              ],
                            ),
                            // Text('تم تلقي طلبك'),
                            // SizedBox(width:2.w,),
                            // CircleAvatar(
                            //   radius: 10.sp,
                            //   child: Center(
                            //     child: Text('2'),
                            //   ),
                            // ),
                            // SizedBox(width: 1.w,),
                            // Text('تم تلقي طلبك',style: TextStyle(fontSize: 10.sp),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              height: 40.h,
                              width: double.infinity,
                              child: GoogleMap(
                                myLocationButtonEnabled: true,
                                myLocationEnabled: true,
                                onMapCreated: (googleController) {
                                  controller = googleController;
                                },
                                markers: cubit.markers,
                                initialCameraPosition: CameraPosition(
                                  zoom: 14,
                                  target: LatLng(
                                    cubit.position.latitude,
                                    cubit.position.longitude,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
                                height:size.height>1000?MediaQuery.of(context).size.height*0.19: MediaQuery.of(context).size.height*0.21,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'معلومات السائق',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      endIndent: 2.w,
                                      indent: 2.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 20.sp,
                                                backgroundImage: NetworkImage(
                                                    'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png')),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text('محمد احمد علي',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.phone,
                                              color: redColor,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
                                height: MediaQuery.of(context).size.height*0.20,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'معلومات الوجبه',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: redColor),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      endIndent: 1.w,
                                      indent: 1.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('ساندوتش العائله',style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          'x 2',
                                          style: TextStyle(color: redColor,fontSize:size.height>1000?8.sp: 15.sp,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('بيبس', style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          'x 2',
                                          style: TextStyle(color: redColor,fontSize:size.height>1000?8.sp: 15.sp,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
                                height: MediaQuery.of(context).size.height*0.32,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'السعر',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: redColor),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      endIndent: 1.w,
                                      indent: 1.w,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('سعر الوجبه', style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '100 SAR',
                                          style: TextStyle(color: redColor,fontSize:size.height>1000?8.sp: 15.sp,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('توصيل', style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '10 SAR',
                                          style: TextStyle(color: redColor,fontSize:size.height>1000?8.sp: 15.sp,),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                      endIndent: 1.w,
                                      indent: 1.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('الاجمالي', style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '110 SAR',
                                          style: TextStyle(color: redColor,fontSize:size.height>1000?8.sp: 15.sp,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('طريقه الدفع', style: TextStyle(fontSize:size.height>1000?8.sp: 15.sp,),),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          'كاش',
                                          style: TextStyle(color: redColor,fontSize:size.height>1000?8.sp: 15.sp,),
                                        ),
                                      ],
                                    ),
                                    // Text('طريقه الدفع'),
                                    // Text('كاش')
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 20.h,
                            //   width: double.infinity,
                            //   child: Column(
                            //     children: [
                            //       Text('معلومات المطعم'),
                            //       Divider(
                            //         thickness: 2,
                            //         endIndent: 2.w,
                            //         indent: 2.w,
                            //       ),
                            //       Text('مطعم كنتاكي'),
                            //       Row(
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Icon(
                            //                 Icons.location_on_outlined,
                            //                 color: redColor,
                            //               ),
                            //               Text('شارع رشيد'),
                            //             ],
                            //           ),
                            //           Container(
                            //             height: 10.h,
                            //             width: 15.w,
                            //             decoration: BoxDecoration(
                            //                 image: DecorationImage(
                            //                     image: NetworkImage(
                            //                         'https://cdn4.premiumread.com/?url=https://alyaum.com/uploads/images/2021/03/07/1005793.png&w=500&q=72&f=jpg'))),
                            //           )
                            //         ],
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 2.h,
                            // ),
                            // Container(
                            //   height: 20.h,
                            //   width: double.infinity,
                            //   child: Column(
                            //     children: [
                            //       Text('معلومات المطعم'),
                            //       Divider(
                            //         thickness: 2,
                            //         endIndent: 2.w,
                            //         indent: 2.w,
                            //       ),
                            //       Text('مطعم كنتاكي'),
                            //       Row(
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Icon(
                            //                 Icons.location_on_outlined,
                            //                 color: redColor,
                            //               ),
                            //               Text('شارع رشيد'),
                            //             ],
                            //           ),
                            //           Container(
                            //             height: 10.h,
                            //             width: 15.w,
                            //             decoration: BoxDecoration(
                            //                 image: DecorationImage(
                            //                     image: NetworkImage(
                            //                         'https://cdn4.premiumread.com/?url=https://alyaum.com/uploads/images/2021/03/07/1005793.png&w=500&q=72&f=jpg'))),
                            //           )
                            //         ],
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
      );
    });
  }
}
