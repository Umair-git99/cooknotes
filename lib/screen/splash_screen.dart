import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'login_screen.dart';

class SplashScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset('assets/cooknotes2.png'),
            nextScreen: LoginScreen(mockData),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.fade,
            splashIconSize: 250,
            backgroundColor: Colors.white));
  }
}
