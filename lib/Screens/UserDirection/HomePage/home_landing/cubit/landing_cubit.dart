import 'package:create_cv/Screens/CV/build_options_page.dart';
import 'package:create_cv/Screens/UserDirection/Dashboard/views/dashboard_view.dart';
import 'package:create_cv/Screens/UserDirection/HomePage/home_landing/home_page.dart';
import 'package:create_cv/Screens/UserDirection/Profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'landing_state.dart';


class HomeLandingTeacherCubit extends Cubit<HomeTeacherLandingState> {
  HomeLandingTeacherCubit() : super(HomeTeacherLandingInatialState());
  static HomeLandingTeacherCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const ProfileScreen(),
    const HomePage(),
    const DashBoradView(),
    const BuildOptionsPage(),
  ];
  List<String> titles = [
    'المزيد',
    'الكورسات',
    'الطلاب',
    'الرئيسية',
  ];

  int currentIndex = 1;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(NewBottomNavbar());
  }
}
