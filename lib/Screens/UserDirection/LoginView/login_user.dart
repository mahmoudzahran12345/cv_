import 'package:animate_do/animate_do.dart';
import 'package:create_cv/Screens/UserDirection/LoginView/cubit_login/login_Cubit.dart';
import 'package:create_cv/Screens/UserDirection/LoginView/cubit_login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../ForgetPassword/forget_password.dart';
import '../HomePage/home_page.dart';
import '../SignUpView/sign_up_user.dart';
import '../user_direction.dart';


class LoginUSerPage extends StatelessWidget {
  const LoginUSerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
          if(state is LoginStateSuccessfulAsUserState){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sizer(
                  builder: (context, orientation,
                      deviceType) =>
                  const HomePage(),
                ),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('تم تسجيل الدخول بنجاح'),
              backgroundColor: Colors.green,
            ));
          }
          else if(state is LoginStateErrorStateLogin){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(' حدث خطا ما ${state.error}'),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context,state){
          return Scaffold(
            body: PopScope(
              canPop: false,
              onPopInvoked: (bool didPop) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sizer(
                      builder: (context, orientation, deviceType) =>
                      const UserDirection(),
                    ),
                  ),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.h,
                        ),
                        FadeInDown(
                          delay: const Duration(milliseconds: 900),
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              children: [
                                Image.asset('assets/Images/Logo.png',
                                    height: 7.h),
                              ],
                            ),
                          ),
                        ),
                        FadeInDown(
                          delay: const Duration(milliseconds: 600),
                          duration: const Duration(milliseconds: 700),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Color(0xFF139487),
                                fontFamily: 'Arimo',
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInDown(
                          delay: const Duration(milliseconds: 600),
                          duration: const Duration(milliseconds: 700),
                          child: Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeInDown(
                              delay: const Duration(milliseconds: 600),
                              duration: const Duration(milliseconds: 700),
                              child: inputFile(
                                  controller: LoginCubit.get(context).email,
                                  label: "Email")),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInDown(
                              delay: const Duration(milliseconds: 600),
                              duration: const Duration(milliseconds: 700),
                              child: inputFile(
                                controller: LoginCubit.get(context).password,
                                  label: "Password", obscureText: true))
                        ],
                      ),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sizer(
                                      builder:
                                          (context, orientation, deviceType) =>
                                      const ForgetPassword(),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Forget Password?!',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF139487),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 3, left: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: const Border(
                                    bottom: BorderSide(color: Colors.black),
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  )),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {
                                  if (
                                      LoginCubit.get(context).email.text.isEmpty &&
                                      LoginCubit.get(context).password.text.isEmpty)
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text(' برجاء التاكيد من البيانات المدخلة'),
                                    ));
                                  }
                                  else {
                                    LoginCubit.get(context).login();
                                  }

                                  LoginCubit.get(context).login();

                                },
                                color: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xFF139487),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sizer(
                                      builder:
                                          (context, orientation, deviceType) =>
                                      const SignUpUser(),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF139487),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: const Divider(
                                  thickness: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.h,
                            ),
                            const Text("OR"),
                            SizedBox(
                              width: 3.h,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(right: 20),
                                child: const Divider(
                                  thickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.h,
                          ),
                          Expanded(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                'assets/Images/5296499_fb_facebook_facebook logo_icon.png',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Expanded(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                'assets/Images/11244080_x_twitter_elon musk_twitter new logo_icon.png',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.h,
                          ),
                          Expanded(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                'assets/Images/pngwing.com.png',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

// we will be creating a widget for text field

