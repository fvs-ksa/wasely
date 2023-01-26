import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/detailsmeal_cubit/cubit.dart';
import 'package:wasely/cubit/detailsmeal_cubit/state.dart';

import 'cart_screens/cart_screen.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key}) : super(key: key);
  _PatternVibrate() {
    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );
    HapticFeedback.mediumImpact();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=DetailMealsCubit.get(context);
    return BlocConsumer<DetailMealsCubit, DetailsMealsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   bottom: PreferredSize(child: preferredSize: Size.fromHeight(175.sp)),
          // ),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 175.sp,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i1.wp.com/kintakicook.com/wp-content/uploads/2020/01/1.png?resize=531%2C531&ssl=1'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.sp, vertical: 30.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_outlined)),
                        Badge(
                          badgeColor: redColor,

                            position: BadgePosition.topStart(top: -1,start: -1 ),
                            badgeContent: Text(cubit.cartCount.toString(),style: TextStyle(color: Colors.white),),
                            child: IconButton(
                                onPressed: () {
                                  if(cubit.cartCount==0){
                                    print('object');
                                  }else{
                                    navigateTo(context: context, child: CartScreen(amount:cubit.cartCount ,image: 'https://i1.wp.com/kintakicook.com/wp-content/uploads/2020/01/1.png?resize=531%2C531&ssl=1',
                                      price:cubit.total ,));
                                  }
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.cartShopping,
                                  color: amberColor,
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                child: Text(
                  'وجبه كنتاكي كبيره تكفي شخصين على الاقل تتكون من 2 ساندوتش وصدور دجاج مقلي وكانز كولا',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 3,
                ),
              ),
              Spacer(flex: 1),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 50.sp,

                  // color: Colors.redAccent,
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 28.0.sp),
                          child: Row(
                            children: [
                              InkWell(
                                onTap:(){
                                  if(cubit.mealsCount==1){
                                    print('object');
                                  }else{
                                    cubit.decrementCartCount();
                                  }

                                },
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text('-'),
                                ),
                              ),
                              SizedBox(width: 10.sp,),
                              Text(cubit.mealsCount.toString()),
                              SizedBox(width: 10.sp,),
                              InkWell(
                                onTap: (){
                                  cubit.incrementMealsCount();
                                },
                                child: CircleAvatar(
                                  radius: 13,
                                  child: Text('+'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('${cubit.total}SAR'),
                        SizedBox(width: 30.sp,),

                        InkWell(
                          onTap: (){
                            cubit.addToCart();
                           // _PatternVibrate();
                            HapticFeedback.vibrate();
                          },
                          child: Row(
                            children: [
                              Text('اضافه الي السله '),
                              CircleAvatar(radius: 13,child: Icon(Icons.check,color: amberColor,),),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
