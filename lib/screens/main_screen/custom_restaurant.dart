import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/screens/inner_screen/tabs_restaurant/offers_restaurant.dart';
import 'package:wasely/screens/inner_screen/tabs_restaurant/sandwich_restaurant.dart';

import '../../component/item_bar.dart';
import '../../cubit/state.dart';
import '../inner_screen/tabs_oredrs_screen/current_order.dart';
import '../inner_screen/tabs_oredrs_screen/pervious_order.dart';
import '../inner_screen/tabs_restaurant/all_product_restaurant.dart';
import '../inner_screen/tabs_restaurant/meals_restaurat.dart';

class CustomRestaurant extends StatefulWidget {
  int index;
  String nameOfRestaurant;

  CustomRestaurant({required this.index,required this.nameOfRestaurant});
  @override
  State<CustomRestaurant> createState() => _CustomRestaurantState();
}

class _CustomRestaurantState extends State<CustomRestaurant>
    with TickerProviderStateMixin {
  // CustomRestaurant({Key? key}) : super(key: key);
  late TabController controller;

  void _setTabActive() {
    GeneralCubit.get(context).changeIndexTab(value: controller.index);
  }

  @override
  void initState() {
    controller = TabController(length: 4, initialIndex: 0, vsync: this);
    controller.addListener(_setTabActive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit,GeneralState>(
      listener: (context,state){},
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    child: TabBar(
                      physics: BouncingScrollPhysics(),
                        controller: controller,
                        labelPadding: EdgeInsets.all(8),
                        labelColor: redColor,
                        indicatorWeight: 0.1,
                        unselectedLabelColor: Colors.black,
                        isScrollable: true,
                        onTap: (int i){

                        },
                        tabs: [
                          Tab(child: ItemBar(title: 'الكل',indexItem: 0),),
                          Tab(child: ItemBar(title: 'الوجبات',indexItem: 1),),
                          Tab(child: ItemBar(title: 'السندوتشات',indexItem: 2),),
                          Tab(child: ItemBar(title: 'العروض',indexItem: 3),),
                        ]),
                  ),
                ),
              ), preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*.1)),
              title: Text(widget.nameOfRestaurant),
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: TabBarView(controller: controller,children: [
                AllProductOfRestaurant(),
                MealsRestaurant(),
                SandwichRestaurant(),
                OffersRestaurant(),
              ]),
            ),
          ),
        );
      },
    );
  }
}
