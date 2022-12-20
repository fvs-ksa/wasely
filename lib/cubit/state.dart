abstract class GeneralState{}
class GeneralInitState extends GeneralState {}
class NativeSplashState extends GeneralState{}
class ChangeTabBarState extends GeneralState{}
class ChangeFirstLastState extends GeneralState{}
class AddAddressLoadingState extends GeneralState{}
class AddAddressSuccessState extends GeneralState{}
class AddAddressErrorState extends GeneralState{
  final String error;
  AddAddressErrorState({required this.error});
}
class GetCurrentAddressSuccessState extends GeneralState{}
class GetCurrentAddressLoadingState extends GeneralState{}
class GetCurrentAddressErrorState extends GeneralState{
  String error;
  GetCurrentAddressErrorState(this.error);
}
// class LoadingShimmerTrueState extends GeneralState{}
// class LoadingShimmerFalseState extends GeneralState{}
class SearchState extends GeneralState{}

