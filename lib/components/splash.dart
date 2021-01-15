import 'package:flutter/material.dart';
//import 'package:fluttershophome/pages/home.dart';
import 'package:fluttershophome/pages/login2.dart';
import 'package:splashscreen/splashscreen.dart';
class splashscrn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('images/logo.png'),
      navigateAfterSeconds: Login2(),
      photoSize: 100,
      loaderColor: Colors.green,
    );
  }
}