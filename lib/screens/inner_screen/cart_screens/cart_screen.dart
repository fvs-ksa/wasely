import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/app_bar_cart.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/screens/inner_screen/cart_screens/address_screen.dart';

import '../../../cubit/detailsmeal_cubit/cubit.dart';
import '../../../cubit/detailsmeal_cubit/state.dart';

class CartScreen extends StatelessWidget {

  String image;
 // String name;
  int amount;
  int price;
   CartScreen({Key? key,required this.image,required this.price,required this.amount}) : super(key: key);
TextEditingController noteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   // var cubit=DetailMealsCubit.get(context);
    return BlocConsumer<DetailMealsCubit, DetailsMealsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: appBarCart(),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('مطعم كنتاكي',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: redColor),),
                  Row(
                    children: [
                      Container(
                        width: 70.sp,
                        height: 70.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  image,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Column(
                          children: [
                            Text('وجبه كنتاكي الكبيره',style: TextStyle(fontWeight: FontWeight.w800),),
                            SizedBox(height: 10.sp,),
                            Row(
                              children: [
                                Text('${price} SAR',style: TextStyle(fontWeight: FontWeight.w800),),
                                SizedBox(width: 10.sp,),
                                Text('X${amount}',style: TextStyle(color: redColor),),


                              ],
                            ),

                          ],
                        ),

                      ),

                    ],
                  ),
                  SizedBox(height: 40.sp,),
                  TextFormField(
                    controller: noteController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'اضف ملاحظاتك هنا',
                    ),
                    maxLines: 5,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                           // Text('${cubit.total}SAR'),
                           // SizedBox(width: 30.sp,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 18.0.sp),
                              child: InkWell(
                                onTap: (){
                                  navigateTo(context: context, child: AddressScreen(mealCount: amount,mealName: 'وجبه كنتاكي الكبيره',mealPrice: price,));
                                  // cubit.addToCart();
                                  // // _PatternVibrate();
                                  // HapticFeedback.vibrate();
                                },
                                child: Row(
                                 // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('الاستمرار'),
                                    CircleAvatar(backgroundColor: Colors.white,radius: 13,child: Icon(Icons.arrow_forward_ios,color: redColor,),),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
