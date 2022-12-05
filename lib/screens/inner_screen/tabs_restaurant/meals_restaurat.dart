import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/model/restaurant_model.dart';
import 'package:wasely/screens/inner_screen/meal_details.dart';

class MealsRestaurant extends StatelessWidget {
  const MealsRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              navigateTo(context: context, child: MealDetails());
            },
            child: mealsContainer(
                mainHeight: 175.sp,
                secondHeight: 130.sp,
                image:NetworkImage('https://www.thaqfny.com/wp-content/uploads/2020/11/%D9%88%D8%AC%D8%A8%D8%A7%D8%AA-%D9%83%D9%86%D8%AA%D8%A7%D9%83%D9%8A-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9-1.jpg'),
                price: 150, mealName: 'وجبه صغيره'),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.sp,
          );
        },
        itemCount: 10);
  }
}
