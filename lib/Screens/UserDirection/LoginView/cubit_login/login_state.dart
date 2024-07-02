abstract class LoginState {}

class LoginStateInatialState extends LoginState {}

class LoginStateLoadingState extends LoginState {}

class LoginStateSuccessfulAsStudentState extends LoginState {}

class LoginStateSuccessfulAsUserState extends LoginState {}

class LoginStateErrorStateLogin extends LoginState {
  final String error;
  LoginStateErrorStateLogin({required this.error});
}
