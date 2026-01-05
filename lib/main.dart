import 'package:monitoring_and_control_app/models/user.dart';
//import 'package:monitoring_and_control_app/screens/splash.dart';
import 'package:monitoring_and_control_app/screens/wrapper.dart';
import 'package:monitoring_and_control_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,  //user in auth class
      child: MaterialApp(
        home: SplashScreen(
            seconds: 3,
            backgroundColor: Colors.blue[100],
            image: Image.asset("assets/MC_App.png"),
            photoSize: 150.0,
            navigateAfterSeconds:Wrapper(),
        ),
      ),
    );
  }
}
