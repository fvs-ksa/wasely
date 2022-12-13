import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';

class DriverOfferScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DriverOfferScreenState();
  }
}

class _DriverOfferScreenState extends State<DriverOfferScreen> {
  @override
  initState() {
    super.initState();
  }

  List<int> items = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text('Woolha.com Flutter Tutorial'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Center(
            child: StreamBuilder(
              stream: generateNumbers,
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
                      LoadingBouncingLine.circle(backgroundColor: redColor,borderColor: redColor),
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
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    items.add(snapshot.data!);
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 3,
                            color: Colors.white,
                            child: Container(
                              height: 20.h,
                              width: 10.w,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.sp,
                                      backgroundImage: NetworkImage(
                                          'https://w7.pngwing.com/pngs/831/88/png-transparent-user-profile-computer-icons-user-interface-mystique-miscellaneous-user-interface-design-smile-thumbnail.png'),
                                    ),
                                    SizedBox(
                                      height: 2.w,
                                    ),
                                    Text(
                                      'محمد احمد',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700),
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
                                    SizedBox(height: 1.h,),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                            border: Border.all(color: Colors.green)
                                          ),
                                          child: Center(child: Text('اتصال'),),
                                        ),
                                        VerticalDivider(thickness: 5,color: Colors.white,),

                                        Container(
                                          width: 40.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: redColor),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          child: Center(child: Text('محادثه'),),
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
                        itemCount: items.length,
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
      ),
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
