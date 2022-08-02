import 'package:buildcondition/buildcondition.dart';
import 'package:firist_project/app2/shard/prefs/shared_pref.dart';
import 'package:firist_project/app2/taqdem/raf3/cubit4/cubit4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/components.dart';
import '../Requst/custom_button.dart';
import 'cubit4/cubit4.dart';
import 'cubit4/states4.dart';

class Raf3 extends StatefulWidget {
  @override
  State<Raf3> createState() => _TakState();
}

class _TakState extends State<Raf3> {
  final currentIndex = 1;
  String? selectedValue;
  var nameController = TextEditingController();

  var nameController1 = TextEditingController();

  var nameController2 = TextEditingController();

  var nameController3 = TextEditingController();

  var nameController4 = TextEditingController();
  var nameController9 = TextEditingController();
  var nameController10 = TextEditingController();

  var schoolController = TextEditingController();
  List<String> items = [
    'مجال العلوم الطبية',
    'مجال الذكاء الاصطناعي',
    'مجال الأدب في كتابة الرواية',
  ];

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  int age = 20;
  String? selectedValue2;
  List<String> items2 = [
    'ذكر',
    'انثي',
  ];
  bool ismale = true;
  List<String> item = [
    'مجال العلوم الطبية',
    'مجال الذكاء الاصطناعي',
    'مجال الأدب في كتابة الرواية',
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<raf3Cubit>(context);
    final rafCubit = BlocProvider.of<raf3Cubit>(context);

    return BlocConsumer<raf3Cubit, Raf3tStates>(
      listener: (context, state) async {
        if (state is Raf3SuccessState) {
          showToast(
            text: 'تم ارسال الطلب بنجاح',
            color: Color(0xff647295),
            time: 3,
          );
        } else if (state is Raf3ErrorState) {
          // showToast(
          //   text: 'لم يتم قبول طلبك حتي الان حتي تتمكن من ارسال المشروع',
          //   color: Color(0xff647295),
          //   time: 3,
          // );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'ارسال المشروع',
              style: TextStyle(
                  color: Color(0xff647295),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      height: 15.0,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: nameController9,
                              validator: (val) {
                                if (val!.length < 1) {
                                  return 'برجاء ادخال لينك جوجل درايف';
                                }

                                return null;
                              },
                              keyboardType: TextInputType.url,
                              decoration: InputDecoration(
                                labelText: 'لينك درايف',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.at,
                                  color: Color(0xff647295),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 35,
                      width: double.infinity,
                      child: BuildCondition(
                        condition: state is! Raf3LoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(SharedPref().getUserToken());
                              rafCubit.userRaf3(
                                driveLink: nameController9.text,
                              );
                            }
                          },
                          text: 'التسجيل',
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
