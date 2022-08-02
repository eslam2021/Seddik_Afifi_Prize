import 'dart:convert';
import 'dart:developer';

import 'package:firist_project/app2/shard/prefs/shared_pref.dart';
import 'package:firist_project/app2/taqdem/raf3/cubit4/states4.dart';
import 'package:firist_project/app2/taqdem/raf3/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../components/components.dart';

class raf3Cubit extends Cubit<Raf3tStates> {
  raf3Cubit() : super(Raf3InitialState()) {}
  static raf3Cubit get(context) => BlocProvider.of(context);
  Raf3Model? RafModel;
  bool isButtonLoading = false;

  Future<Map<String, dynamic>> contactUsMessage2({
    required String driveLink,
  }) async {
    const String url =
        'http://siddiKAfifi.somee.com/api/Comp/UploadProjectAsync';
    final headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization': "Bearer " + SharedPref().getUserToken(),
    };
    final body = {
      'driveLink': driveLink.toString(),
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
      showToast(text: data['message'], color: Colors.red, time: 3);
      throw data['message'] as String? ?? "fake message";
    }
  }

  Future<dynamic> userRaf3({
    required String driveLink,
  }) async {
    try {
      var response = await contactUsMessage2(
        driveLink: driveLink,
      );
      RafModel = Raf3Model.fromJson(response);
      if (RafModel!.check)
        emit(Raf3SuccessState());
      else
        emit(Raf3ErrorState(RafModel!.message));
    } catch (error, s) {
      emit(Raf3ErrorState(error.toString()));
      log('error on send project', error: error, stackTrace: s);
      print('message: 2');
      print('Message Error: ${error.toString()}');
    }
  }

  void setButtonLoading(bool isLoading) {
    isButtonLoading = isLoading;
    emit(Raf3RefreshState());
  }
}
