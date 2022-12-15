import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/all_meals_cubit/cubit.dart';
import 'package:wasely/cubit/all_meals_cubit/state.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/state.dart';
import 'package:wasely/model/restaurant_model.dart';
import 'package:wasely/shimmer/shimmer_loading_home.dart';

import '../../../shimmer/shimmer_loading_meals.dart';
import '../meal_details.dart';

class AllProductOfRestaurant extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = AllMealsCubit.get(context);
    return BlocConsumer<AllMealsCubit,AllMealsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if(!cubit.isLoadingShimmer){
                return InkWell(
                  onTap: () {
                    navigateTo(context: context, child: MealDetails());
                  },
                  child: mealsContainer(
                      image: NetworkImage(
                          'https://www.thaqfny.com/wp-content/uploads/2020/11/%D9%88%D8%AC%D8%A8%D8%A7%D8%AA-%D9%83%D9%86%D8%AA%D8%A7%D9%83%D9%8A-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9-1.jpg'),
                      price: 150,
                      mealName: 'وجبه صغيره'),
                );
              }else{
                return ShimmerLoadingMeals();
              }

            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 1.h,
              );
            },
            itemCount: 10);
      },
    );
  }
}

Widget containerOfAllMeals(AllMeals allMeals) {
  return mealsContainer(
      image: NetworkImage(allMeals.image),
      mealName: allMeals.name,
      price: allMeals.price);
}
