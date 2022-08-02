import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firist_project/app2/login2/cubit/cubit.dart';
import 'package:firist_project/app2/login2/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../about/66.dart';
import '../goals/Goals.dart';
import 'home3.dart';

class Asd extends StatefulWidget {
  const Asd({Key? key}) : super(key: key);

  @override
  _AsdState createState() => _AsdState();
}

class _AsdState extends State<Asd> {
  // BottomBar Setting
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Authors(),
    Gols(),
    Home3(),
  ];

  void _changeItem(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) {
          //var cubit = BlocProvider.of<UserCubit>(context);
          //var userData = cubit.model;
          return Scaffold(
            backgroundColor: Colors.white,
            body: _widgetOptions[_currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.white,
              animationDuration: Duration(milliseconds: 670),
              buttonBackgroundColor: Color(0xff647295),
              color: Color(0xff647295),
              items: [
                Icon(
                  FontAwesomeIcons.info,
                  color: Colors.white,
                ),
                Icon(
                  FontAwesomeIcons.calendar,
                  color: Colors.white,
                ),
                Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
              ],
              onTap: _changeItem,
              index: _currentIndex,
            ),
          );
        },
      ),
    );
  }

  Widget buildImage() => Image.asset(
        'images/sedic2.jpeg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 400,
      );
}
