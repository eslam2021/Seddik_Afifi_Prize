import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../register/register.dart';
import '../home/Home.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Asd()), (route) => false);
          loginCubit.getUserData();
          loginCubit.getConData();
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'أهلا بعودتك',
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
                            controller: emailController,
                            validator: (val) {
                              if (val!.length > 150) {
                                return ' برجاء ادخال البريد الالكتروني اخر';
                              }
                              if (val.length < 10) {
                                return ' برجاء ادخال البريد الالكتروني اخر';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'البريد الالكتروني',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                FontAwesomeIcons.at,
                                color: Color(0xff647295),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText:
                                LoginCubit.get(context).isPasswordShowen,
                            validator: (val) {
                              if (val!.length > 15) {
                                return 'الرقم السري اقل من 15 رقم';
                              }
                              if (val.length < 9) {
                                return 'الرقم السري اقل من 9 ارقام';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(
                                  LoginCubit.get(context).sufix,
                                ),
                              ),
                              labelText: 'كلمه السر',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.lock,
                                  color: Color(0xff647295)),
                            ),
                          ),
                        ),
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const ForgetPass()),
                              // );
                            },
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        BuildCondition(
                          condition: state is! LoginLoadingState,
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
                                  LoginCubit.get(context).userLogiN(
                                    email: emailController.text,
                                    password: passwordController.text,
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
                                MaterialPageRoute(
                                    builder: (context) => Register()),
                              );
                            },
                            child: Text(
                              'سجل هنا ',
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
