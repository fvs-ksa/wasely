import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/all_meals_cubit/cubit.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/detailsmeal_cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/cubit.dart';
import 'package:wasely/pallette.dart';
import 'package:wasely/screens/auth_screen/login_screen.dart';
import 'package:wasely/screens/inner_screen/cart_screens/cart_screen.dart';
import 'package:wasely/screens/drawer_screen/contact_us.dart';
import 'package:wasely/screens/inner_screen/meal_details.dart';
import 'package:wasely/screens/drawer_screen/notification_screen.dart';
import 'package:wasely/screens/drawer_screen/order_screen.dart';
import 'package:wasely/screens/drawer_screen/profile_screen.dart';
import 'package:wasely/screens/main_screen/home_screen.dart';
import 'package:wasely/screens/onBorading_screen.dart';
import 'package:wasely/utils/shared_pref.dart';

import 'bloc_observe.dart';
import 'cubit/state.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
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
            BlocProvider<DetailMealsCubit>(
                create: (context) => DetailMealsCubit()..getCurrentLocation(),),
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
                    home: HomeScreen(),
                  );
                });
              })),
    );
  }
}
