import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/screens/inner_screen/meal_details.dart';

class OffersRestaurant extends StatelessWidget {
  const OffersRestaurant({Key? key}) : super(key: key);

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
                image: NetworkImage(
                  'https://i1.wp.com/kintakicook.com/wp-content/uploads/2020/01/1.png?resize=531%2C531&ssl=1',),
                mealName: 'وجبه كنتاكي الكبيره',
                price: 90),
          );
        },
        separatorBuilder: (context, index) {
        return  SizedBox(height: 10.sp,);
        },
        itemCount: 10);
  }
}
