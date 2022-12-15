import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/cubit/all_meals_cubit/cubit.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/detailsmeal_cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/cubit.dart';
import 'package:wasely/pallette.dart';
import 'package:wasely/screens/onBorading_screen.dart';
import 'package:wasely/utils/shared_pref.dart';

import 'bloc_observe.dart';
import 'cubit/custom_order_cubit/cubit.dart';
import 'cubit/state.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  //await BlocConsumer<GeneralCubit,GeneralState>(builder: (context,state){return Text('data');},listener: (context,state){},);
  // currentLocation=CacheHelper.getData(key: 'address');
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiBlocProvider(
          providers: [
            BlocProvider<GeneralCubit>(
                create: (context) => GeneralCubit()..initialization()),
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
                    home: OnBoradingScreen(),
                  );
                });
              })),
    );
  }
}
