import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/component/item_bar.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/cubit.dart';
import 'package:wasely/cubit/state.dart';
import 'package:wasely/screens/inner_screen/tabs_oredrs_screen/current_order.dart';
import 'package:wasely/screens/inner_screen/tabs_oredrs_screen/pervious_order.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with TickerProviderStateMixin {
   late TabController tabController;

   void setActiveTab(){
GeneralCubit.get(context).changeIndexTab(value: tabController.index);
   }
   @override
  void initState() {
     tabController=TabController(length: 2, vsync: this,initialIndex: 0);
    tabController.addListener(setActiveTab);
    super.initState();
  }

  //OrderScreen({required this.tabController});
  @override
  Widget build(BuildContext context) {
     var cubit=GeneralCubit.get(context,);
   return BlocConsumer<GeneralCubit,GeneralState>(
      listener: (context,state){},
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                  child: Card(
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
                      controller: tabController,
                      labelPadding: EdgeInsets.all(8),
                      labelColor: redColor,
                      indicatorWeight: 0.1,
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      onTap: (int i){
                        cubit.changeIndexTab(value: i);
                      },
                      tabs: [
                        Tab(child: ItemBar(title: 'الحاليه',indexItem: 0),),
                        Tab(child: ItemBar(title: 'السابقه',indexItem: 1),),
                      ]),
                ),
              ), preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*.1)),
              title: Text('طلباتي'),
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: TabBarView(controller: tabController,children: [
                CurrentOrder(),
                PreviousOrder(),
              ]),
            ),
          ),
        );
      },
    );

  }
}
