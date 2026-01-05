import 'package:flutter/material.dart';
import 'package:monitoring_and_control_app/screens/wrapper.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      backgroundColor: Colors.blue[100],
      image: Image.asset("assets/MC_App.png"),
      photoSize: 150.0,
      navigateAfterSeconds:Wrapper(),
    );
  } 
}
