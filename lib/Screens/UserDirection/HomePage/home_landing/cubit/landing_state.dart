abstract class HomeTeacherLandingState {}

class HomeTeacherLandingInatialState extends HomeTeacherLandingState {}

class HomeTeacherLandingLoadingState extends HomeTeacherLandingState {}

class HomeTeacherLandingSuccessfulState extends HomeTeacherLandingState {}

class HomeTeacherLandingErrorState extends HomeTeacherLandingState {
  final String error;
  HomeTeacherLandingErrorState(this.error);
}
// class changepassword extends HomeTeacherLandingState{}

class NewBottomNavbar extends HomeTeacherLandingState {


}


