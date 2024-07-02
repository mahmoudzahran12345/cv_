import 'package:animate_do/animate_do.dart';
import 'package:create_cv/Screens/UserDirection/ForgetPassword/Cubit_forget_password/forget_password.dart';
import 'package:create_cv/Screens/UserDirection/ForgetPassword/Cubit_forget_password/forget_password_state.dart';
import 'package:create_cv/Screens/UserDirection/ForgetPassword/forget_password.dart';
import 'package:create_cv/Screens/UserDirection/ForgetPassword/verfication_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../LoginView/login_user.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePassWordState>(
        listener: (context,state){
          if( state is ResetPassWordSuccessful){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Sizer(
                  builder: (context, orientation,
                      deviceType) =>
                  const LoginUSerPage(),
                ),
              ),
            );
          }
          else if(state is ResetPassWordStateError)
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(' حدث خطا ما ${state.error}'),
                backgroundColor: Colors.red,
              ));
            }
        },
          builder: (context, state) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.white,
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: Colors.white,
          // ),
          body: PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sizer(
                    builder: (context, orientation, deviceType) =>
                        const ForgetPassword(),
                  ),
                ),
              );
            },
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            FadeInDown(
                              delay: const Duration(milliseconds: 900),
                              duration: const Duration(milliseconds: 1000),
                              child: Container(
                                padding: const EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    Image.asset('assets/Images/Logo.png',
                                        height: 7.h),
                                    FadeInDown(
                                      delay: const Duration(milliseconds: 600),
                                      duration:
                                          const Duration(milliseconds: 700),
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          "Create New Password",
                                          style: TextStyle(
                                              color: Color(0xFF139487),
                                              fontFamily: 'Arimo',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            FadeInDown(
                              delay: const Duration(milliseconds: 600),
                              duration: const Duration(milliseconds: 700),
                              child: Text(
                                "Your new password must be different",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[700]),
                              ),
                            ),
                            FadeInDown(
                              delay: const Duration(milliseconds: 600),
                              duration: const Duration(milliseconds: 700),
                              child: Text(
                                "from previous used passwords.",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[700]),
                              ),
                            )
                          ],
                        ),
                        FadeInLeft(
                          delay: const Duration(milliseconds: 600),
                          duration: const Duration(milliseconds: 700),
                          child: Container(
                            padding: const EdgeInsets.only(top: 100),
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/Images/Security On.gif"),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: <Widget>[
                              FadeInDown(
                                  delay: const Duration(milliseconds: 600),
                                  duration: const Duration(milliseconds: 700),
                                  child: TextField(
                                    controller:
                                        ChangePasswordCubit.get(context)
                                            .OTP,
                                    decoration: InputDecoration(
                                      labelText: 'OTP',
                                      border: OutlineInputBorder(),
                                    ),
                                  )),
                              SizedBox(height: 10,),
                              FadeInDown(
                                  delay: const Duration(milliseconds: 600),
                                  duration: const Duration(milliseconds: 700),
                                  child: TextField(
                                    controller:
                                        ChangePasswordCubit.get(context)
                                            .newPassword,
                                    decoration: InputDecoration(
                                      labelText: 'New Password',
                                      border: OutlineInputBorder(),
                                    ),
                                  )),
                              SizedBox(height: 10,),

                              FadeInDown(
                                  delay: const Duration(milliseconds: 600),
                                  duration: const Duration(milliseconds: 700),
                                  child: TextField(
                                    controller:
                                        ChangePasswordCubit.get(context)
                                            .confirmPassword,
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      border: OutlineInputBorder(),
                                    ),
                                  ))
                            ],
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
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 3),
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
                                      ChangePasswordCubit.get(context)
                                          .newPassWord();

                                    },
                                    color: const Color(0xFF139487),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w400,
            color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            hoverColor: Color(0xFF139487),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xFF139487)),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
