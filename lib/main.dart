import 'package:flutter/material.dart';
import 'package:stream/Login/login_page.dart';
import 'HomePage/homePage.dart';
import 'Login/forgotpass.dart';
import 'Login/regis_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(



      title: 'stream',

home: MainPage(),


      debugShowCheckedModeBanner: false,



      // Routes

      routes: {
        'LoginPage': (context)=>LoginPage(),
        'Register': (context)=>Regis(),
        'Forgot' : (context)=>Forgot(),
        'homePage': (context)=>homePage(),

      },




    );
  }
}