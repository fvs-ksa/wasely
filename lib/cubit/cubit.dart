import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wasely/cubit/state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitState());

  static GeneralCubit get(BuildContext context) => BlocProvider.of(context);

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 2));
    print('ready in 2...');

    print('go!');
    FlutterNativeSplash.remove();
    emit(NativeSplashState());
  }

  int indexTab = 0;

  void changeIndexTab({required var value}) {
    indexTab = value;
    print('object');
    emit(ChangeTabBarState());
  }

  bool isLastFirstBoarding = false;

  changeFirstBoarding() {
    isLastFirstBoarding = true;
    emit(ChangeFirstLastState());
  }

}
