abstract class TermsAndAboutUsState{}
class InitialState extends TermsAndAboutUsState{}
class GetTermsLoadingState extends TermsAndAboutUsState{}
class GetTermsSuccessState extends TermsAndAboutUsState{}
class GetTermsErrorState extends TermsAndAboutUsState{
  final String error;
  GetTermsErrorState({required this.error});
}
class GetAboutUsLoadingState extends TermsAndAboutUsState{}
class GetAboutUsSuccessState extends TermsAndAboutUsState{}
class GetAboutUsErrorState extends TermsAndAboutUsState{
  final String error;
  GetAboutUsErrorState({required this.error});
}