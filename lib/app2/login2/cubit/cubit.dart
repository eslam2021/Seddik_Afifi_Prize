import 'dart:convert';
import 'dart:developer';

import 'package:firist_project/app2/login2/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../components/components.dart';
import '../../network/remote/dio_helper.dart';
import '../../profile/Con_model.dart';
import '../../profile/profileMedel.dart';
import '../../shard/prefs/shared_pref.dart';
import '../loginclass.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState()) {}

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  bool isButtonLoading = false;
  var token = '';

  Future<Map<String, dynamic>> contactUseMessage({
    required String email,
    required String password,
  }) async {
    const String url = 'http://siddikafifi.somee.com/api/Account/Login';
    final _token = SharedPref().getUserToken();
    print('token2' + _token.toString());
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': "Bearer " + _token,
    };
    final body = {
      'email': email.toString(),
      'password': password.toString(),
    };
    final response = await post(
      Uri.parse(url),
      headers: headers,
      body: const Utf8Encoder().convert(
        jsonEncode(body),
      ),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    log(data.toString());
    if (data['check'] == true) {
      showToast(text: 'تم تسجيل دخول بنجاح', color: Color(0xff647295), time: 3);
      return data;
    } else {
      showToast(text: data['message'], color: Color(0xff647295), time: 3);
      throw data['message'] as String? ?? "fake message";
    }
  }

  Future<dynamic> userLogiN({
    required String email,
    required String password,
  }) async {
    try {
      var response = await contactUseMessage(
        email: email,
        password: password,
      );
      loginModel = LoginModel.fromJson(response);
      if (loginModel!.check) {
        SharedPref().saveUserToken(loginModel!.token);
        emit(LoginSuccessState(loginModel!.token));
      } else
        emit(LoginErrorState(loginModel!.token));
    } catch (error, s) {
      emit(LoginErrorState(error.toString()));
      log('error on send project', error: error, stackTrace: s);
      print('message: 2');
      print('Message Error: ${error.toString()}');
    }
  }

  void setButtonLoading(bool isLoading) {
    isButtonLoading = isLoading;
    emit(LoginRefreshState());
  }

  UserDataModel? model;

  Future getUserData() async {
    print(SharedPref().getUserToken());
    await DioHelper.getData(
      url: 'User/Profile',
      token: SharedPref().getUserToken(),
    )!
        .then((value) {
      print(value!.data['mobileNumber']);
      // model2 = UserModel.fromJson(value.data);
      model = UserDataModel.fromJson(value.data);
      print(model!.name);
    }).catchError((error) {
      print(error.toString());
    });
  }

  ConDataModel? model9;

  Future getConData() async {
    print(SharedPref().getUserToken());
    await DioHelper.getData(
      url: 'Comp/Profile',
      token: SharedPref().getUserToken(),
    )!
        .then((value) {
      print(value!.data['mobileNumber']);
      // model2 = UserModel.fromJson(value.data);
      model9 = ConDataModel.fromJson(value.data);
      print(model9!.name);
    }).catchError((error) {
      print(error.toString());
    });
  }

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;

  void changePasswordVisibility() {
    isPasswordShowen = !isPasswordShowen;
    sufix = isPasswordShowen
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ScrollChangePasswordVisibilityStates());
  }
}
