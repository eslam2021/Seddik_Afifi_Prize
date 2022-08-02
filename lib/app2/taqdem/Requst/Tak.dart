import 'package:buildcondition/buildcondition.dart';
import 'package:firist_project/app2/home/Home.dart';
import 'package:firist_project/app2/login2/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../shard/prefs/shared_pref.dart';
import 'cubit3/cubit3.dart';
import 'cubit3/states3.dart';
import 'custom_button.dart';

class Tak extends StatefulWidget {
  @override
  _TakState createState() => _TakState();
}

class _TakState extends State<Tak> {
  final currentIndex = 1;
  var phonController = TextEditingController();
  var nameController = TextEditingController();
  var nameController1 = TextEditingController();
  var nameController2 = TextEditingController();
  var nameController3 = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = true;
  int age = 20;
  String? Value;
  String? Value1;
  List<String> items3 = [
    'ذكر',
    'انثي',
  ];
  bool ismale = true;
  List<String> items2 = [
    'مجال العلوم الطبيه التطبيقيه',
    'مجال المعلوماتيه و الذكاء الاصطناعي',
    'مجال الأدب في كتابه الروايه',
  ];

  @override
  Widget build(BuildContext context) {
    final requstCubit = BlocProvider.of<RequstCubit>(context);
    var userCubit = LoginCubit.get(context);
    return BlocConsumer<RequstCubit, RequstStates>(listener: (context, state) {
      if (state is RequstSuccessState) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Asd()), (route) => false);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'ارسال طلب ',
            style: TextStyle(
                color: Color(0xff647295),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  defaultFormField(
                    controller: nameController1,
                    label: 'اسم المتقدم بالكامل',
                    prefix: Icons.person,
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخال الاسم بالكامل';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    label: 'البريد الالكتروني',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'البريد الالكتروني لايجب ان تكون فارغه';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    label: 'العنوان',
                    prefix: Icons.add_location_alt,
                    type: TextInputType.text,
                    controller: nameController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return ' برجاء ادخال العنوان ';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    label: ' الحساب البنكي',
                    prefix: Icons.credit_card,
                    type: TextInputType.number,
                    controller: nameController2,
                    Maxlength: 6,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return ' برجاء ادخال رقم الحساب ';
                      }
                      if (nameController2.text.length < 3) {
                        return 'رقم الحساب غير صحيح ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    label: 'الرقم القومي',
                    prefix: Icons.app_registration_sharp,
                    type: TextInputType.number,
                    controller: nameController3,
                    Maxlength: 14,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return ' برجاء ادخال الرقم القومي ';
                      }
                      if (nameController3.text.length < 14 &&
                          nameController3.text.length > 14) {
                        return 'الرقم القومي لا يقل 14 رقم';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: ageController,
                    label: 'العمر',
                    prefix: Icons.date_range,
                    type: TextInputType.number,
                    Maxlength: 2,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخال عمرك';
                      }
                      final int age = int.parse(ageController.text);
                      if (age >= 18 && age <= 5) {
                        return 'العمر لايقل عن 5 ولا يزيد عن 18';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  defaultFormField(
                    controller: phonController,
                    label: 'رقم الهاتف',
                    prefix: Icons.phone,
                    Maxlength: 11,
                    type: TextInputType.phone,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return ' برجاء ادخال رقم الهاتف ';
                      }
                      if (phonController.text.length < 11 &&
                          phonController.text.length > 11) {
                        return 'رقم الهاتف لا يقل 11 رقم';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xff647295), width: 3)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: Value1,
                        iconSize: 40,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff647295),
                        ),
                        elevation: 4,
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            '''التخصص''',
                            style: TextStyle(
                              color: Color(0xff647295),
                              fontFamily: 'ElMessiri',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        focusColor: Colors.white,
                        items: items2.map(buildMenuItem2).toList(),
                        onChanged: (Value1) =>
                            setState(() => this.Value1 = Value1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xff647295), width: 3)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: Value,
                        iconSize: 40,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff647295),
                        ),
                        elevation: 4,
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            '''النوع''',
                            style: TextStyle(
                              color: Color(0xff647295),
                              fontFamily: 'ElMessiri',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        focusColor: Colors.white,
                        items: items3.map(buildMenuItem1).toList(),
                        onChanged: (Value) =>
                            setState(() => this.Value = Value),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  BuildCondition(
                    condition: !requstCubit.isButtonLoading,
                    builder: (context) => CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(SharedPref().getUserToken());
                          var token = SharedPref().getUserToken().toString();
                          requstCubit.userRequest(
                              tittle: nameController.text,
                              age: ageController.text,
                              gender: Value!,
                              mobileNumber: phonController.text,
                              fullName: nameController1.text,
                              email: emailController.text,
                              bankAccount: nameController2.text,
                              specialization: Value1!,
                              nationalId: nameController3.text);
                        }
                      },
                      text: 'التسجيل',
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  DropdownMenuItem<String> buildMenuItem1(String item1) => DropdownMenuItem(
        value: item1,
        child: Center(
          child: Text(
            item1,
            style: TextStyle(
              color: Color(0xff647295),
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem2(String item2) => DropdownMenuItem(
        value: item2,
        child: Center(
          child: Text(
            item2,
            style: TextStyle(
              color: Color(0xff647295),
              fontFamily: 'ElMessiri',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
