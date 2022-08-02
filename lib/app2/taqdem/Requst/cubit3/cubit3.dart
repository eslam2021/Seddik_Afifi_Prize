import 'dart:convert';
import 'dart:developer';

import 'package:firist_project/app2/components/components.dart';
import 'package:firist_project/app2/shard/prefs/shared_pref.dart';
import 'package:firist_project/app2/taqdem/Requst/cubit3/states3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../user_model3.dart';

class RequstCubit extends Cubit<RequstStates> {
  RequstCubit() : super(RequstInitialState()) {}
  static RequstCubit get(context) => BlocProvider.of(context);
  RequstModel? requstModel;
  bool isButtonLoading = false;

  Future<Map<String, dynamic>> contactUsMessage({
    required String fullName,
    required String email,
    required String bankAccount,
    required String nationalId,
    required String age,
    required String mobileNumber,
    required String gender,
    required String tittle,
    required String specialization,
  }) async {
    const String url = 'http://siddiKAfifi.somee.com/api/User/CompRegs';
    final _token = SharedPref().getUserToken();
    print('token2' + _token.toString());
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': "Bearer " + _token,
    };
    final body = {
      'fullName': fullName.toString(),
      'nationalId': nationalId.toString(),
      'tittle': tittle.toString(),
      'specialization': specialization.toString(),
      'email': email.toString(),
      'mobileNumber': mobileNumber.toString(),
      'bankAccount': bankAccount.toString(),
      'age': age.toString(),
      'gender': gender.toString(),
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
      showToast(text: data['message'], color: Color(0xff647295), time: 3);
      return data;
    } else {
      showToast(text: data['message'], color: Color(0xff647295), time: 3);
      throw data['message'] as String? ?? "fake message";
    }
  }

  Future<dynamic> userRequest({
    required String fullName,
    required String email,
    required String bankAccount,
    required String nationalId,
    required String age,
    required String mobileNumber,
    required String gender,
    required String tittle,
    required String specialization,
  }) async {
    try {
      var response = await contactUsMessage(
        fullName: fullName,
        email: email,
        bankAccount: bankAccount,
        nationalId: nationalId,
        age: age,
        mobileNumber: mobileNumber,
        gender: gender,
        tittle: tittle,
        specialization: specialization,
      );
      requstModel = RequstModel.fromJson(response);
      if (requstModel!.check)
        emit(RequstSuccessState());
      else
        emit(RequstErrorState(requstModel!.message));
    } catch (error, s) {
      emit(RequstErrorState(error.toString()));
      log('error on send project', error: error, stackTrace: s);
      print('message: 2');
      print('Message Error: ${error.toString()}');
    }
  }

  var genderValue;

  void selectGenderChange(value) {
    genderValue = value;
    emit(SelectGenderChangeState());
  }

  var specialistValue;

  void selectSpecialistChange(value) {
    specialistValue = value;
    emit(SelectSpecialistChangeState());
  }

  void setButtonLoading(bool isLoading) {
    isButtonLoading = isLoading;
    emit(RequstRefreshState());
  }
}
