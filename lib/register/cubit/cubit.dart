import 'package:firist_project/app2/profile/profileMedel.dart';
import 'package:firist_project/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app2/network/remote/dio_helper.dart';
import '../registerclass.dart';

class RegisterCuibit extends Cubit<RegisterStates> {
  RegisterCuibit() : super(RegisterInitialState()) {}

  static RegisterCuibit get(context) => BlocProvider.of(context);
  registerModel? registModel;
  bool isButtonLoading = false;
  Future userLRegister({
    required String email,
    required String password,
    required String name,
    required String confPassword,
    required String mobileNumber,
    required String nationalID,
    required String gender,
    required int age,
  }) async {
    emit(RegisterLoadingState());
    UserDataModel model = UserDataModel(
      nationalID: nationalID,
      name: name,
      password: password,
      email: email,
      age: age,
      confPassword: confPassword,
      gender: gender,
      mobileNumber: mobileNumber,
    );
    await DioHelper.postData(
      url: 'Account/Register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'gender': gender,
        'Age': age,
        'nationalID': nationalID,
        'confPassword': confPassword,
        'mobileNumber': mobileNumber,
      },
    )!
        .then((value) {
      // SharedPref().saveUserToken(registModel!.token);

      model.token = value?.data['token'];
      emit(RegisterSuccessState());
      print('success');
    }).catchError((error) {
      print(error);
      print('Error');
      emit(RegisterErrorState(error.toString()));
    });
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

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;

  void changePasswordVisibility() {
    isPasswordShowen = !isPasswordShowen;
    sufix = isPasswordShowen
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityStates());
  }

  void setButtonLoading(bool isLoading) {
    isButtonLoading = isLoading;
    emit(RegisterRefreshState());
  }
}
