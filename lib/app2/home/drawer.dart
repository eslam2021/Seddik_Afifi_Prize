import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../login2/cubit/cubit.dart';
import '../magalat/magaalat.dart';
import '../taqdem/Requst/Tak.dart';
import '../taqdem/raf3/raf3.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    var userData = cubit.model;
    // var data = cubit.;
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(userData!.name!),
          accountEmail: Text(userData.email!),
          currentAccountPicture: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/qwe.jpeg'),
          ),
          otherAccountsPictures: <Widget>[],
          onDetailsPressed: () {},
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/fundo.jpg"), fit: BoxFit.cover)),
        ),
        Divider(),
        ListTile(
          title: const Text(
            'مجالات الجائزة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          leading: const Icon(
            Icons.auto_stories_sharp,
            size: 30,
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Magalaaat()),
            );
          },
        ),
        ListTile(
          title: const Text(
            'تقديم المتسابق',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          leading: const Icon(
            Icons.person,
            size: 30,
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            // print(status);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tak()),
            );
          },
        ),
        // if (status != null && status == 'Accepted')
        ListTile(
          title: const Text(
            'ارسال الملف ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          leading: const Icon(
            Icons.person,
            size: 30,
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Raf3()),
            );
          },
        ),

        ListTile(
          title: const Text(
            'تواصل معنا',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'ElMessiri'),
            textDirection: TextDirection.rtl,
          ),
          leading: const Icon(
            Icons.whatsapp,
            color: Colors.green,
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            launchWhatsapp(number: "+201559919944 ", message: "Hello");
          },
        ),
        Divider(),
        ListTile(
            title: Text('Close'),
            leading: Icon(Icons.close),
            onTap: () {
              Navigator.of(context).pop();
            }),
      ]),
    );
  }
}

void launchWhatsapp({required number, required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";
  await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
}
