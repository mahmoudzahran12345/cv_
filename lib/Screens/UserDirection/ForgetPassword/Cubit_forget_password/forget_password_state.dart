abstract class ChangePassWordState {}

class ChangePassWordStateInatialState extends ChangePassWordState {}

class ChangePassWordStateLoadingState extends ChangePassWordState {}

class ChangePassWordStateSuccessful extends ChangePassWordState {}

class ChangePassWordStateError extends ChangePassWordState {
  final String error;
  ChangePassWordStateError(this.error);

}

class ResetPassWordInatialState extends ChangePassWordState {}

class ResetPassWordLoadingState extends ChangePassWordState {}

class ResetPassWordSuccessful extends ChangePassWordState {}

class ResetPassWordStateError extends ChangePassWordState {
  final String error;
  ResetPassWordStateError(this.error);
}