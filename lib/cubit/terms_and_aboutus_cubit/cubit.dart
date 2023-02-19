import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasely/cubit/terms_and_aboutus_cubit/state.dart';
import 'package:wasely/model/about_us_model.dart';
import 'package:wasely/model/terms_model.dart';
import 'package:wasely/services/base_url.dart';
import 'package:wasely/services/dio_helper.dart';

class TermsAndAboutUsCubit extends Cubit<TermsAndAboutUsState>{
  TermsAndAboutUsCubit():super(InitialState());
  static TermsAndAboutUsCubit get(context)=>BlocProvider.of(context);
 late TermsModel termsModel;
 bool isGetTerms=false;
  getTerms(){
    emit(GetTermsLoadingState());
    DioHelper.getData(url: BaseUrl.terms,token: token).then((value){
        isGetTerms=false;
        termsModel=TermsModel.fromJson(value.data);
        print(termsModel.appSettings?.terms);
        print(value.data);
        isGetTerms=true;
        emit(GetTermsSuccessState());
    }).catchError((e){
      print(e.toString());

      emit(GetTermsErrorState(error: e.toString()));
    });
  }
  bool isGetAboutUs=false;
  late AboutUsModel aboutUsModel;
  getAboutUs(){
    emit(GetAboutUsLoadingState());
    DioHelper.getData(url: BaseUrl.aboutUs,token: token).then((value){
      isGetAboutUs=false;
      aboutUsModel=AboutUsModel.fromJson(value.data);
      isGetAboutUs=true;
      emit(GetAboutUsSuccessState());
      print(aboutUsModel.appSettings?.aboutUs);
    }).catchError((e){
      print(e.toString());
      emit(GetAboutUsErrorState(error: e.toString()));
    });
  }
}