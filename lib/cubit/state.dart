abstract class GeneralState{}
class GeneralInitState extends GeneralState {}
class ChangeAuthState extends GeneralState{}
class NativeSplashState extends GeneralState{}
class ChangeTabBarState extends GeneralState{}
class ChangeFirstLastState extends GeneralState{}
class GetCurrentAddressSuccessState extends GeneralState{}
class GetCurrentAddressLoadingState extends GeneralState{}
class GetCurrentAddressErrorState extends GeneralState{
  String error;
  GetCurrentAddressErrorState(this.error);
}
// class LoadingShimmerTrueState extends GeneralState{}
// class LoadingShimmerFalseState extends GeneralState{}
class SearchState extends GeneralState{}

