import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: AnimatedSplashScreen(
    //         duration: 3000,
    //         splash: Image.asset('assets/cooknotes2.png'),
    //         nextScreen: LoginScreen(),
    //         splashTransition: SplashTransition.slideTransition,
    //         pageTransitionType: PageTransitionType.scale,
    //         //photosize:
    //         backgroundColor: Colors.white));

    return SplashScreen(
      seconds: 8,
      navigateAfterSeconds: LoginScreen(),
      image: new Image.asset('assets/cooknotes2.png'),
      backgroundColor: Colors.white,
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white70,
        ],
      ),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      loaderColor: Colors.black,
    );
  }
}
