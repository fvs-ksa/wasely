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
    return BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {
      // if(state is GetCurrentLocOrderDetailsLoadingState){
      //   return  showLoaderDialog(context: context);
      // }
    }, builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('تفاصيل طلبك'),
          ),
          body: state is GetCurrentLocOrderDetailsLoadingState
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.h),
                  child: Column(
                    children: [
                      Container(
                        height: 40.h,
                        width: double.infinity,
                        child: GoogleMap(

                          // scrollGesturesEnabled: false,
                          // rotateGesturesEnabled: false,
                          // mapToolbarEnabled: false,
                          // myLocationButtonEnabled: false,
                          // myLocationEnabled: false,
                          // compassEnabled: false,
                          // indoorViewEnabled: false,
                          // trafficEnabled: false,
                          // buildingsEnabled: false,
                          // zoomGesturesEnabled: false,
                          // zoomControlsEnabled: false,
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
                      Expanded(
                        // height: MediaQuery.of(context).size.height,
                        // width:  MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 2.h),
                                  height: 20.h,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                              Text('محمد احمد علي'),
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
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('معلومات المطعم'),
                                    Divider(
                                      thickness: 2,
                                      endIndent: 2.w,
                                      indent: 2.w,
                                    ),
                                    Text('مطعم كنتاكي'),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: redColor,
                                            ),
                                            Text('شارع رشيد'),
                                          ],
                                        ),
                                        Container(
                                          height: 10.h,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://cdn4.premiumread.com/?url=https://alyaum.com/uploads/images/2021/03/07/1005793.png&w=500&q=72&f=jpg'))),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('معلومات المطعم'),
                                    Divider(
                                      thickness: 2,
                                      endIndent: 2.w,
                                      indent: 2.w,
                                    ),
                                    Text('مطعم كنتاكي'),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: redColor,
                                            ),
                                            Text('شارع رشيد'),
                                          ],
                                        ),
                                        Container(
                                          height: 10.h,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://cdn4.premiumread.com/?url=https://alyaum.com/uploads/images/2021/03/07/1005793.png&w=500&q=72&f=jpg'))),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
        ),
      );
    });
  }
}
