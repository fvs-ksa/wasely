abstract class ProfileState{}
class InitialProfileState extends ProfileState{}
class WaselyGetProfileLoadingState extends ProfileState{}
class WaselyGetProfileSuccessState extends ProfileState{}
class WaselyGetProfileErrorState extends ProfileState{
  String error;
  WaselyGetProfileErrorState({required this.error});
}