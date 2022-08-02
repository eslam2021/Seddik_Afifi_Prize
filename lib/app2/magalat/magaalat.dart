import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'The field of informatics and jerking intelligence.dart';
import 'The field of literature in the writing of the novel.dart';
import 'field of applied medical sciences.dart';

class Magalaaat extends StatefulWidget {
  @override
  _MagalaaatState createState() => _MagalaaatState();
}

class _MagalaaatState extends State<Magalaaat> {
  int _currentIndex = 0;
  List<Widget> screens = [
    Sc(),
    Ai(),
    NavigateToStories(),
  ];

  void _changeItem(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 670),
        buttonBackgroundColor: Color(0xff647295),
        color: Color(0xff647295),
        items: [
          Icon(
            FontAwesomeIcons.camera,
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
  }
}
