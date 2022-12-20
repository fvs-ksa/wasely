import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/cubit/all_meals_cubit/cubit.dart';
import 'package:wasely/cubit/auth_cubit/auth_cubit.dart';
import 'package:wasely/cubit/chat_cubit/cubit.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/detailsmeal_cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/cubit.dart';
import 'package:wasely/cubit/order_details_cubit/cubit.dart';
import 'package:wasely/pallette.dart';
import 'package:wasely/screens/auth_screen/login_screen.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';
import 'package:wasely/screens/onBorading_screen.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';
import 'package:wasely/utils/shared_pref.dart';

import 'bloc_observe.dart';
import 'cubit/custom_order_cubit/cubit.dart';
import 'cubit/state.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
 await DioHelper.init();
  Widget widget;
  if(CacheHelper.getData(key: 'onBoarding')==null){
    widget=OnBoradingScreen();
  }else if(CacheHelper.getData(key: 'onBoarding')==true &&CacheHelper.getData(key: 'token')==null ){
    bool onBoarding=CacheHelper.getData(key: 'onBoarding');
    print(onBoarding);
    widget=LoginScreen();
  }else{
    token=CacheHelper.getData(key: 'token');
    print(token.toString());
    widget=HomeScreen();
  }
   runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiBlocProvider(
          providers: [
            BlocProvider<GeneralCubit>(
                create: (context) => GeneralCubit()..initialization()..getUserCurrentLocation()),
            BlocProvider<AuthCubit>(
                create: (context) => AuthCubit()),
            BlocProvider<ChatCubit>(
                create: (context) => ChatCubit()),
            BlocProvider<OrderDetailsCubit>(
                create: (context) => OrderDetailsCubit()..getCurrentLocation()..addMarkers()),
            BlocProvider<AllMealsCubit>(
                create: (context) =>
                    AllMealsCubit()..loadAllMealsShimmerData()),
            BlocProvider<CustomOrderCubit>(
                create: (context) => CustomOrderCubit()..generateNumbers),
            BlocProvider<DetailMealsCubit>(
              create: (context) => DetailMealsCubit()..getCurrentLocation(),
            ),
            BlocProvider<HomeCubit>(
                create: (context) => HomeCubit()..loadHomeData()),
          ],
          child: BlocConsumer<GeneralCubit, GeneralState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Sizer(builder: (context, orientation, deviceType) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'وصلي',
                    theme: ThemeData(
                      primarySwatch: Palette.kToDark,
                      textTheme: GoogleFonts.notoNaskhArabicTextTheme(
                        Theme.of(context).textTheme,
                      ),
                    ),
                    home:startWidget,
                  );
                });
              })),
    );
  }
}
