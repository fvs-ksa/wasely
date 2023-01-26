import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';

import '../../../cubit/custom_order_cubit/cubit.dart';
import '../../../cubit/custom_order_cubit/state.dart';
import 'chat_screen.dart';

class DriverOfferScreen extends StatefulWidget {
  DriverOfferScreen({Key? key}) : super(key: key);

  @override
  State<DriverOfferScreen> createState() => _DriverOfferScreenState();
}

class _DriverOfferScreenState extends State<DriverOfferScreen> {
  List<int> items = [];
@override
  // void dispose() {
  // CustomOrderCubit.get(context).generateNumbers.
  // }
  @override
  Widget build(BuildContext context) {
    var cubit = CustomOrderCubit.get(context);
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<CustomOrderCubit, CustomOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(

          backgroundColor: Colors.white70,
          appBar: AppBar(
            actions: [IconButton(onPressed: (){cubit.generateNumbers1();}, icon: Icon(Icons.refresh,size:size.height>1000?12.sp:15.sp))],
            title: const Text('عروض السائقين'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: FutureBuilder(
                future: cubit.generateNumbers1(),

                initialData: 'برجاء الانتظار حتى ياتيك الرد من قبل السائقين',
                builder: (
                  BuildContext context,
                  AsyncSnapshot snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingBouncingLine.circle(
                            backgroundColor: redColor, borderColor: redColor),
                        //  CircularProgressIndicator(),
                        //  LinearProgressIndicator(),
                        Visibility(
                          visible: snapshot.hasData,
                          child: Text(
                            snapshot.data.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 24),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                          ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error.toString()}');
                    } else if (snapshot.hasData) {
                      // items.add(snapshot.data!);
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.sp, vertical: 5.sp),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            // return Text(
                            //     items[index].toString(),
                            //     style: const TextStyle(color: Colors.teal, fontSize: 36)
                            // );
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 3,
                              color: Colors.white,
                              child: Container(
                                height: 21.h,
                                width: 10.w,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(

                                          radius: 20.sp,
                                          backgroundImage: NetworkImage(

                                              snapshot.data[index].image,

                                          ),
                                        ),
                                        title: Text(
                                          snapshot.data[index].name,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        subtitle: Text(
                                          'السعر: ${snapshot.data[index].price.toString()} ر.س',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),

                                      Spacer(
                                        flex: 1,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        indent: 3.w,
                                        thickness: 2,
                                        endIndent: 3.w,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print(CustomOrderCubit
                                                  .driver[index].phone);
                                              print(
                                                  snapshot.data[index].phone);
                                              navigateTo(
                                                  context: context,
                                                  child: ChatScreen(
                                                    name: snapshot
                                                    .data[index].name,
                                                    image: snapshot
                                                        .data[index].image,
                                                    index: snapshot
                                                        .data[index].id,
                                                    phone: CustomOrderCubit
                                                        .driver[index].phone,
                                                  ));
                                            },
                                            child: Container(
                                              width: 40.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.green)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('قبول',style: TextStyle(fontSize: size.height>1000?9.sp: 8.sp),),
                                                    FaIcon(
                                                      FontAwesomeIcons.check,
                                                      color: Colors.green,
                                                      size:size.height>1000?12.sp:15.sp ,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                            thickness: 5,
                                            color: Colors.white,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print(CustomOrderCubit
                                                  .driver[index].id);
                                              print(snapshot.data[index].id);
                                            },
                                            child: Container(
                                              width: 40.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: redColor),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('رفض',style: TextStyle(fontSize: size.height>1000?9.sp: 8.sp)),
                                                    Icon(
                                                      Icons.highlight_remove,
                                                      color: redColor,
                                                      size:size.height>1000?12.sp:15.sp ,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                      // Row(
                                      //   children: [
                                      //
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 2.h,
                            );
                          },
                          itemCount: snapshot.data.length,
                        ),
                      );
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// class NumberCreator{
//   var _count = 1;
//   final _controller = StreamController<int>();
//   NumberCreator(){
//     Timer.periodic(Duration(seconds: 10), (timer) {
//       _controller.sink.add(_count);
//       _count++;
//     });
//
//   }
//   di
// }

Stream<int> generateNumbers = (() async* {
  await Future<void>.delayed(Duration(seconds: 5));

  for (int i = 1; i <= 5; i++) {
    await Future<void>.delayed(Duration(seconds: 4));
    print(i);
    yield i;
  }
})();
