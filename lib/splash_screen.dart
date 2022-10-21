import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:stream/Login/login_page.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      splash: 'assets/logo/mark1.png',splashIconSize: 250,
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.black,
      nextScreen: LoginPage(),
    );
  }
}