import 'package:buildcondition/buildcondition.dart';
import 'package:firist_project/app2/taqdem/Requst/Tak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../app2/components/components.dart';
import '../app2/login2/login.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Register extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final kindController = TextEditingController();
  final phonController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController1 = TextEditingController();
  final nationalIDController = TextEditingController();
  final ageController = TextEditingController();
  List<String> items = [
    'ذكر',
    'انثي',
  ];
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCuibit(),
      child: BlocConsumer<RegisterCuibit, RegisterStates>(
          listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        }
      }, builder: (context, state) {
        final cubit = RegisterCuibit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'مرحبا بك',
              style: TextStyle(
                  color: Color(0xff647295),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(50),
                      shadowColor: Color(0xff647295),
                      child: Lottie.asset('assets/lottie/SignUp.json',
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.30)),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'الاسم بالكامل',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.user,
                                  color: Color(0xff647295)),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال الاسم بالكامل';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'البريد الالكتروني',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                FontAwesomeIcons.at,
                                color: Color(0xff647295),
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال البريد الالكتروني';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText:
                                RegisterCuibit.get(context).isPasswordShowen,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCuibit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(
                                  RegisterCuibit.get(context).sufix,
                                ),
                              ),
                              labelText: 'كلمه السر',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.lock,
                                  color: Color(0xff647295)),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال كلمه السر';
                              }
                              if (value.length > 15) {
                                return 'الرقم السري يجب اكبر من 15 رقم';
                              }
                              if (value.length < 6) {
                                return 'الرقم السري ضعيف اصغر من 6 ارقام';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: passwordController1,
                            obscureText:
                                RegisterCuibit.get(context).isPasswordShowen,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCuibit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(
                                  RegisterCuibit.get(context).sufix,
                                ),
                              ),
                              labelText: 'تاكيد كلمه السر ',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.lock,
                                  color: Color(0xff647295)),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال كلمه السر';
                              }
                              if (passwordController1.text !=
                                  passwordController.text) {
                                return 'كلمة السر غير مطابقه للكلمه الاولى';
                              }
                              if (value.length > 15) {
                                return 'الرقم السري يجب اكبر من 15 رقم';
                              }
                              if (value.length < 6) {
                                return 'الرقم السري ضعيف اصغر من 6 ارقام';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: nationalIDController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'الرقم القومي',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.lock,
                                  color: Color(0xff647295)),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال الرقم القومي';
                              }
                              if (value.length != 14) {
                                return 'الرقم السري يجب ان يكون مكون من 14 رقم';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: phonController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'رقم الموبيل',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.phone,
                                  color: Color(0xff647295)),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال رقم الموبيل';
                              } else if (value.length > 11) {
                                return 'رقم الموبيل يجب ان يكون مكون من 11 رقم';
                              } else if (value.length < 11) {
                                return 'رقم الموبيل يجب ان يكون مكون من 11 رقم';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'العمر',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.phone,
                                  color: Color(0xff647295)),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال العمر';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 15.0),
                        customDropDownButtonFormField(
                          items: items,
                          hint: Text('النوع'),
                          onChanged: (value) => cubit.selectGenderChange(value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'تسجيل حساب',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        BuildCondition(
                          condition: state is! RegisterLoadingState,
                          fallback: (context) => CircularProgressIndicator(),
                          builder: (context) => Material(
                            elevation: 6,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff647295),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCuibit.get(context).userLRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confPassword: passwordController1.text,
                                    nationalID: nationalIDController.text,
                                    mobileNumber: phonController.text,
                                    name: nameController.text,
                                    gender: cubit.genderValue,
                                    age: int.parse(ageController.text),
                                  );
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Tak()),
                              );
                            },
                            child: Text(
                              'لديك حساب بالفعل سجل الان ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
