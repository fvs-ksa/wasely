import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/app_bar_cart.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';

import '../../../cubit/detailsmeal_cubit/cubit.dart';
import '../../../cubit/detailsmeal_cubit/state.dart';

class AddressScreen extends StatefulWidget {
  String mealName;
  int mealPrice;
  int mealCount;
   AddressScreen({Key? key,required this.mealName,required this.mealCount,required this.mealPrice}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late GoogleMapController googleMapController;
  TextEditingController addressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit=DetailMealsCubit.get(context);
    return BlocConsumer<DetailMealsCubit, DetailsMealsState>(

        listener: (context, state) {},
        builder: (context, state) {

          return  Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: appBarCart(),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('تاكيد الطلب',style: TextStyle(color: redColor),),
                    Divider(),
                    Container(
                      height: 22.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.mealName),
                        SizedBox(width: 28.w,),
                        Text('x${widget.mealCount}',style: TextStyle(color: redColor),),
                          SizedBox(width: 12.w,),
                          Text('${widget.mealPrice} SAR'),
                        ],
                      ),
                    ),
                    Text('طريقه الدفع',style: TextStyle(color: redColor)),
                    Divider(thickness: 2,),
                    Row(

                      children: [
                        FaIcon(FontAwesomeIcons.wallet,color: redColor,),
                        SizedBox(width: 3.w,),
                        Text('الدفع عند الاستلام'),
                      ],
                    ),
                    Divider(thickness: 2,),
                    Text('الفاتوره',style: TextStyle(color: redColor),),
                    Divider(thickness: 2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('المجموع الجزئي'),
                            Text('${widget.mealPrice} SAR'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('توصيل'),
                            Text('10.00 SAR'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('المجموع',style: TextStyle(color: redColor),),
                            Text('510.00 SAR',style: TextStyle(color: redColor),),
                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        Text('شامل الضريبه 15% الرقم الضريبي (2121421212442)\n عزيزي العميل لا يمكن الغاء او تعديل الطلب بعد ارساله')
                      ],
                    ),
                    Spacer(),
                    Align(alignment: Alignment.bottomCenter,child: mainButton(
                        width: 50.w,text: ' ارسال طلب SAR ${widget.mealPrice} ', color: redColor, context: context, fct: (){}))
                  ],
                ),
              ),
            ),

          );
        } );
  }
}
