import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/state.dart';
import 'package:wasely/screens/auth_screen/login_screen.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';
import '../cubit/cubit.dart';
import '../model/board_model.dart';

class OnBoradingScreen extends StatelessWidget {
  var boardController = PageController();
  List<BoardingModel> onboarding = [
    BoardingModel(
        text: 'مرحبا بك',
        image: 'assets/i1.png',
        secondText: 'اطلب طعامك بسهوله'),
    BoardingModel(
        text: 'مرحبا بك',
        image: 'assets/i2.png',
        secondText: 'تمتع بخدمه التوصيل'),
  ];

  Widget buildOnBoarding(BuildContext context, BoardingModel model) {
    return headerContainer(
        context: context,
        text: model.text,
        image: Image.asset(model.image),
        secondText: model.secondText);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                        itemCount: onboarding.length,
                        physics: BouncingScrollPhysics(),
                        controller: boardController,
                        onPageChanged: (int i) {
                          if (i == onboarding.length - 1) {
                            print('last');
                            cubit.changeFirstBoarding();
                          } else {
                            cubit.isLastFirstBoarding =
                                !cubit.isLastFirstBoarding;
                          }
                        },
                        itemBuilder: (context, index) {
                          return buildOnBoarding(context, onboarding[index]);
                        }),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmoothPageIndicator(
                            effect: ExpandingDotsEffect(
                              activeDotColor: redColor,
                              dotColor: Colors.redAccent.shade100,

                            ),
                              controller: boardController,
                              count: onboarding.length),
                          SizedBox(height: 5.h,),
                          mainButton(width: 50.w,text: cubit.isLastFirstBoarding?'دخول الان':'التالي', color: redColor, context: context, fct: (){
                            if(cubit.isLastFirstBoarding){
                              navigateAndReplacement(context: context, child: LoginScreen());
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                            }else{
                              boardController.nextPage(duration: Duration(milliseconds: 750), curve:Curves.fastLinearToSlowEaseIn);
                            }
                          }),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
