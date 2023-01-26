abstract class HomeState{}
class InitialHomeState extends HomeState{}
class LoadingShimmerTrueState extends HomeState{}
class LoadingShimmerFalseState extends HomeState{}

class AddAddressLoadingState extends HomeState{}
class AddAddressSuccessState extends HomeState{}
class AddAddressErrorState extends HomeState{
  final String error;
  AddAddressErrorState({required this.error});
}
class GetCurrentAddressSuccessState extends HomeState{}
class GetCurrentAddressLoadingState extends HomeState{}
class GetCurrentAddressErrorState extends HomeState{
  String error;
  GetCurrentAddressErrorState(this.error);
}
class GetPlaceSuccessState extends HomeState{}
// class LoadingShimmerTrueState extends GeneralState{}
// class LoadingShimmerFalseState extends GeneralState{}
class SearchState extends HomeState{}
class GetBannersLoadingState extends HomeState{}
class GetBannersSuccessState extends HomeState{}
class GetBannersErrorState extends HomeState{
  final String error;
  GetBannersErrorState({required this.error});
}
class ArabicTextFieldAuthState extends HomeState{}
// class WaselyGetProfileLoadingState extends HomeState{}
// class WaselyGetProfileSuccessState extends HomeState{}
// class WaselyGetProfileErrorState extends HomeState{
//   String error;
//   WaselyGetProfileErrorState({required this.error});
// }