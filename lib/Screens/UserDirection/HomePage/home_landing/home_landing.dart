import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/landing_cubit.dart';
import 'cubit/landing_state.dart';

class HomeLanding extends StatelessWidget {
  const HomeLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLandingTeacherCubit(),
      child: BlocConsumer<HomeLandingTeacherCubit, HomeTeacherLandingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,

            body: HomeLandingTeacherCubit.get(context).screens[HomeLandingTeacherCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: HomeLandingTeacherCubit.get(context).currentIndex,
                backgroundColor: const Color(0xFF139487).withOpacity(0.5),
                  onTap: (index) {
                  print(index);
                    HomeLandingTeacherCubit.get(context).changeCurrentIndex(index);
                  },

                items: const [
                  BottomNavigationBarItem(
                        icon:Icon(Icons.person,color: Colors.teal,),
                        label: 'profile',
                      ),
                  BottomNavigationBarItem(
                    icon:Icon(Icons.home,color: Colors.teal,),
                    label: 'profile',
                  ),
                  BottomNavigationBarItem(
                    icon:Icon(Icons.menu,color: Colors.teal,),

                    label: 'profile',
                  ),
                  BottomNavigationBarItem(
                    icon:Icon(Icons.paste,color: Colors.teal,),

                    label: 'profile',
                  ),


                ]),

            // bottomNavigationBar: BottomNavigationBar(
            //   showUnselectedLabels: true,
            //   type: BottomNavigationBarType.fixed,
            //   iconSize: 24,
            //   backgroundColor: Colors.white,elevation: 0.0,selectedIconTheme: const IconThemeData(
            //     color: Colors.teal
            // ),
            //   currentIndex: HomeLandingTeacherCubit.get(context).currentIndex,
            //   onTap: (index) {
            //     HomeLandingTeacherCubit.get(context).changeCurrentIndex(index);
            //   },
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Image.asset(
            //         'assets/images/more.png',
            //         color: HomeLandingTeacherCubit.get(context).currentIndex == 0 ?
            //         Colors.white : Colors.grey,
            //         width: 32,
            //         height: 32,
            //       ),
            //       label: 'المزيد',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Image.asset(
            //         'assets/images/courses.png',
            //         color: HomeLandingTeacherCubit.get(context).currentIndex == 1 ? primaryColor : darkGrey,
            //         width: 32,
            //         height: 32.h,
            //       ),
            //       label: 'الكورسات',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Image.asset(
            //         'assets/images/students.png',
            //         color: HomeLandingTeacherCubit.get(context).currentIndex == 2 ? primaryColor : darkGrey,
            //         width: 32.w,
            //         height: 32.h,
            //       ),
            //       label: 'الطلاب',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Image.asset(
            //         'assets/images/home.png',
            //         color: HomeLandingTeacherCubit.get(context).currentIndex == 3 ? primaryColor : darkGrey,
            //         width: 32.w,
            //         height: 32.h,
            //       ),
            //       label: 'الرئيسية',
            //     ),
            //   ],
            //   selectedItemColor: primaryColor,
            //   unselectedItemColor: darkGrey,
            // ),
          );
        },
      ),
    );
  }
}
