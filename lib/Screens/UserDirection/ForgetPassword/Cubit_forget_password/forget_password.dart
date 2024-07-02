import 'package:create_cv/Api/endPoints/endPoints.dart';
import 'package:create_cv/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_state.dart';
import 'package:dio/dio.dart';

class ChangePasswordCubit extends Cubit<ChangePassWordState> {
  ChangePasswordCubit() : super(ChangePassWordStateInatialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController OTP = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void changePassword() async {
    var token = await CacheNetwork.getCacheData(key: 'token');
    final dio = Dio();
    final response = await dio.post(
      EndPoint.sendOTP,
      data: {
        "email": email.text.trim(),
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      )
    );

    print("jsonBody${response.data['message']}");

    if (response.statusCode == 200) {
      emit(ChangePassWordStateSuccessful());
    }
  }

  void newPassWord() async {
    var token = await CacheNetwork.getCacheData(key: 'token');
    final dio = Dio();
    final response = await dio.post(
      EndPoint.resetPassword,
      data: {
        "email": email.text.trim(),
        "OTP": "123456",
        "newPassWord": newPassword.text.trim(),
        "oldPassWord": confirmPassword.text.trim(),
      },
        options: Options(
            headers: {
              'Authorization': 'Bearer $token'
            }
        )
    );

    print("jsonBody${response.statusCode}");

    if (response.statusCode == 200) {
      print("jsonBody${response.data}");

      emit(ResetPassWordSuccessful());
    }
  }
}
