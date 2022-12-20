import 'package:wasely/model/login_model.dart';

abstract class AuthState{}
class InitialAuthState extends AuthState{}
class ChangeAuthState extends AuthState{}
class WaselyLoadingRegisterAuthState extends AuthState{}
class WaselySuccessRegisterAuthState extends AuthState{}
class WaselyErrorRegisterAuthState extends AuthState{
  final String error;
  WaselyErrorRegisterAuthState({required this.error});
}

class WaselyAuthLoginLoadingState extends AuthState{}
class WaselyAuthLoginSuccessState extends AuthState{
  final LoginModel loginModel;
  WaselyAuthLoginSuccessState({required this.loginModel});
}
class WaselyAuthLoginErrorState extends AuthState{
  final String error;
  WaselyAuthLoginErrorState({required this.error});
}