import 'package:firebase_core/firebase_core.dart';
import 'package:firist_project/app2/shard/prefs/shared_pref.dart';
import 'package:firist_project/app2/taqdem/Requst/remote3/dio_helper3.dart';
import 'package:firist_project/app2/taqdem/raf3/cubit4/cubit4.dart';
import 'package:firist_project/register/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app2/components/constant.dart';
import 'app2/home/Home.dart';
import 'app2/login2/cubit/cubit.dart';
import 'app2/login2/login.dart';
import 'app2/magalat/magaalat.dart';
import 'app2/network/cache_helper/cache_helper.dart';
import 'app2/network/remote/dio_helper.dart';
import 'app2/profile/profile.dart';
import 'app2/taqdem/Requst/cubit3/cubit3.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DioHelper2.init();

  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPref.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCuibit()),
        BlocProvider(create: (context) => raf3Cubit()),
        BlocProvider(create: (context) => RequstCubit()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        routes: {
          'home': (context) => Asd(),
          'mag': (context) => Magalaaat(),
          'Profile': (context) => Profile(),
          'login': (context) => Login(),
        },

        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xffF2EBE5),
          ),
          // ignore: deprecated_member_use
          accentColor: Color(0xffF2EBE5),
          fontFamily: 'El Messier',
        ),
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Login(),
        // home: SharedPrefs.isAuthenticatedUser() ? asd() : Login2(),
      ),
    );
  }
}
