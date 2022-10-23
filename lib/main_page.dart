import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream/splash_screen.dart';
import 'package:stream/Login/login_page.dart';
import 'HomePage/homePage.dart';



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body:  StreamBuilder<User?>(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot){
           if (snapshot.connectionState == ConnectionState.waiting) {
             return const Splash();
           }
           if(snapshot.hasData){
             return homePage();
           }
           else{
             return LoginPage();
           }


         }

     ),


    );
  }
}
