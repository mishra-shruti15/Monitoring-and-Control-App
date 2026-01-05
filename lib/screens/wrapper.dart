import 'package:monitoring_and_control_app/models/user.dart';
import 'package:monitoring_and_control_app/screens/authenticate/authenticate.dart';
import 'package:monitoring_and_control_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);
    
    //return either home or authenticate widget
    if ( user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}