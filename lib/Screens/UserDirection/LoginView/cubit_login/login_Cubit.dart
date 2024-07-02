import 'dart:convert';

import 'package:create_cv/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import '../../../../Api/endPoints/endPoints.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInatialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginStateInatialState());
  }

  void login() async {
    var token = await CacheNetwork.getCacheData(key: 'token');
    try {
      final dio = Dio();
      final response = await dio.post(
        EndPoint.login,
        data: {
          "email": email.text.trim(),
          "password": password.text.trim()
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          }
        )

      );
      if (response.statusCode == 200) {
        print(response.data);
        emit(LoginStateSuccessfulAsUserState());
      }

      else {
        emit(LoginStateErrorStateLogin(
            error: response.statusMessage.toString()));
      }
    } catch (error) {
      emit(LoginStateErrorStateLogin(error: error.toString()));
    }
  }
}