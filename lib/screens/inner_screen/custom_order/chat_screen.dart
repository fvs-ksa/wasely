import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wasely/component/const_color.dart';

import '../../../cubit/custom_order_cubit/cubit.dart';
import '../../../cubit/custom_order_cubit/state.dart';

class ChatScreen extends StatelessWidget {
  int index;
  String phone;
  String image;
  String name;

  ChatScreen(
      {Key? key,
      required this.index,
      required this.phone,
      required this.name,
      required this.image})
      : super(key: key);
  TextEditingController messageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var customOrderCubit = CustomOrderCubit.get(context);
    return BlocConsumer<CustomOrderCubit, CustomOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(15.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.sp),
                          bottomRight: Radius.circular(20.sp))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25.sp,
                              backgroundImage: NetworkImage(image),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await launchUrlString('tel:${phone}');
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.phone,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
             physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context,index){
                        return SizedBox(height: 2.h,);
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          height: 5.h,

                         // width: 1,
                          child: Center(child: Text(customOrderCubit.messages[index],overflow: TextOverflow.ellipsis,)),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.sp),
                                  bottomRight: Radius.circular(15.sp),
                                  bottomLeft: Radius.circular(15.sp)),
                              color: Colors.redAccent.shade100),
                        );
                      },
                      itemCount:customOrderCubit.messages.length,
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  right: 5.w,
                  left: 5.w),
              child: Container(
                height: customOrderCubit.pickImage ? 32.h : 12.h,
                width: MediaQuery.of(context).size.width,
                // color: Colors.green,
                child: Column(
                  children: [
                    //Spacer(flex: 1,),
                    customOrderCubit.pickImage
                        ? Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
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
                        : Container(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            messageController.text.isEmpty
                                ? debugPrint('text')
                                : print(messageController.text);
                            customOrderCubit.sentMessage(messageController.text);
                            messageController.clear();
                          },
                          child: FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        //  CircleAvatar(radius: 20.sp,child: IconButton(onPressed: (){}, icon: Icon(Icons.add_photo_alternate))),
                        // SizedBox(width: 3.w,),
                        Expanded(
                            child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                              hintText: 'رساله',
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    customOrderCubit.pickGalleryImage(context);
                                    print('object');
                                  },
                                  icon:
                                      Icon(Icons.add_photo_alternate_outlined)),
                              hintStyle: TextStyle(
                                color: redColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: redColor),
                              )),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
