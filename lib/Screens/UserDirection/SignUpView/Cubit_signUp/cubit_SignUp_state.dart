abstract class RegisterUserState {}

class RegisterUserStateInatialState extends RegisterUserState {}

class RegisterUserStateLoadingState extends RegisterUserState {}

class RegisterUserSuccessful extends RegisterUserState {}

class RegisterUserError extends RegisterUserState {
  final String error;
  RegisterUserError(this.error);
}


class changePasswordVisibilitySuccessful extends RegisterUserState {}


class CheckDropMenuLoadingUser extends RegisterUserState {}

class CheckDropMenuSuccessfulUser extends RegisterUserState {}



class PickDateBlocLoading extends RegisterUserState {}


class PickDateBlocSSuccessfulState extends RegisterUserState {}















