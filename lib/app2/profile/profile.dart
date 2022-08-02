// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login2/cubit/cubit.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String str = "";
  int userId = 0;
  String roleName = "";
  int index = 0;
  int fullNameLength = 0;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  String fullName = '';
  String email = '';

  @override
  void dispose() {
    fullNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    var userData = cubit.model;
    var ConData = cubit.model9;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          backgroundColor: Color(0xff647295),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Hero(
                        tag: 'tag',
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(65)),
                              border: Border.all(
                                  color: Colors.blueAccent, width: 2)),
                          height: 130,
                          width: 130,
                          padding: const EdgeInsets.all(4),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage("assets/qwe.jpeg"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        userData!.name!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 60,
                ),
                dataItem(
                  L: 40,
                  T: 10,
                  R: 40,
                  B: 10,
                  L1: 50,
                  T1: 0,
                  R1: 0,
                  B1: 0,
                  // ico: Icons.message,
                  context: context,
                  text: 'البريد الالكتروني',
                  text1: userData.email!,
                ),
                const SizedBox(
                  height: 20,
                ),
                dataItem(
                  L: 40,
                  T: 10,
                  R: 40,
                  B: 10,
                  L1: 50,
                  T1: 0,
                  R1: 0,
                  B1: 0,
                  // ico: Icons.verified_user,
                  context: context,
                  text: 'الاسم',
                  text1: userData.name!,
                ),
                const SizedBox(
                  height: 20,
                ),
                dataItem(
                  L: 40,
                  T: 10,
                  R: 40,
                  B: 10,
                  L1: 50,
                  T1: 0,
                  R1: 0,
                  B1: 0,
                  // ico: Icons.phone,
                  context: context,
                  text: 'رقم الموبيل',
                  text1: userData.mobileNumber!,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (ConData!.result != null)
                  dataItem(
                    L: 40,
                    T: 10,
                    R: 40,
                    B: 10,
                    L1: 50,
                    T1: 0,
                    R1: 0,
                    B1: 0,
                    // ico: Icons.info,
                    context: context,
                    text: 'النتيجة',
                    // text1: data!.status ?? 'Under Review',
                    text1: ConData.result!,
                  ),
                if (ConData.specialization != null)
                  dataItem(
                    L: 40,
                    T: 10,
                    R: 40,
                    B: 10,
                    L1: 50,
                    T1: 0,
                    R1: 0,
                    B1: 0,
                    // ico: Icons.info,
                    context: context,
                    text: 'التخصص',
                    // text1: data!.status ?? 'Under Review',
                    text1: ConData.specialization!,
                  ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ));
  }
}

Widget dataItem({
  required BuildContext context,
  required String text,
  required String text1,
  required double L,
  required double T,
  required double R,
  required double B,
  required double L1,
  required double T1,
  required double R1,
  required double B1,
}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(L, T, R, B),
    child: Container(
      decoration: const BoxDecoration(
          color: Color(0xfff6f5f8),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const SizedBox(width: 16),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(L1, T1, R1, B1),
          //   child: Container(
          //     height: 20,
          //     width: 20,
          //     decoration: const BoxDecoration(
          //         color: Color(0xffecebff),
          //         borderRadius: BorderRadius.all(Radius.circular(10))),
          //     // child: Center(
          //     //     child: Icon(
          //     //   // ico,
          //     //   // Icons.security,
          //     //   color: Color(0xff647295),
          //     //   size: 16,
          //     // )),
          //   ),
          // ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 30, 10),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'steve',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Text(text1)
            ],
          )
        ],
      ),
    ),
  );
}
