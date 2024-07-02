import 'dart:convert';
import 'dart:io';

import 'package:create_cv/Api/endPoints/endPoints.dart';
import 'package:create_cv/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../Api/api consumer/apiconcumer.dart';
import 'cubit_SignUp_state.dart';
import 'package:dio/dio.dart';



class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit() : super(RegisterUserStateInatialState());
  static RegisterUserCubit get(context) => BlocProvider.of(context);
  File? post;
  File? image1;
  File? image2;
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  String gender = "Male";
  bool isPasswordVisible = false;



  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(changePasswordVisibilitySuccessful());
  }
  /// create User
  ///
  void register() async {
    emit(RegisterUserStateLoadingState());
   try{
     final dio = Dio();
     final response = await dio.post(
       EndPoint.register,
       data: {
         "email": email.text.trim(),
         "firstName": fName.text.trim(),
         "lastName": lName.text.trim(),
         "phoneNumber":phone.text.trim(),
         "gender":gender.toString(),
         "birthDate":birthday.text.trim(),
         "password": password.text.trim()
       },

     );

     if(response.statusCode == 200){
       CacheNetwork.insertToCache(key: 'token', value: response.data['token']);
       var token = await CacheNetwork.getCacheData(key: 'token');
       print("token111111111111111111111111$token");
       emit(RegisterUserSuccessful());
     }

     else{
       emit(RegisterUserError(response.statusMessage.toString()));
     }
   }catch(error){
     emit(RegisterUserError(error.toString()));
   }



  }

  void genderChoose(value) {

    gender = value;
    emit(CheckDropMenuSuccessfulUser());
  }
  void PickDateBloc(context) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickDate != null) {
      birthday.text = pickDate.toString().split(" ")[0];
    }
    emit(PickDateBlocSSuccessfulState());
  }





}
