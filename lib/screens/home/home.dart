//settings and list of app
import 'package:flutter/material.dart';
//import 'package:imagebutton/imagebutton.dart';
// import 'package:monitoring_and_control_app/screens/authenticate/sign_in.dart';
import 'package:monitoring_and_control_app/screens/home/control.dart';
import 'package:monitoring_and_control_app/screens/home/machine_health.dart';
import 'package:monitoring_and_control_app/screens/home/production.dart';
import 'package:monitoring_and_control_app/services/auth.dart';
//import 'package:monitoring_and_control_app/shared/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Monitoring and Control App"),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async{
                await _auth.signOut();
                // Navigator.of(context)
                //     .push(
                //       MaterialPageRoute(builder: (context) => SignIn()),
                //     );

              },
            ),
          ]  
      ),      
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 100.0),
        decoration: BoxDecoration(
          color: Colors.blue[100],
        ),
        child: Form(
          child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),  
              //   ImageButton(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.only(top: 0.0),
              //       child: Text(
              //         'Production Monitoring',
              //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
              //       ),
              //     )
              //   ],
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   width: 400,
              //   height: 300,
              //   paddingTop: 5,
              //   pressedImage: Image.asset(
              //     "assets/production.jpg",
              //   ),
              //   unpressedImage: Image.asset("assets/production.jpg"),
              //   onTap: () {
              //     Navigator.of(context)
              //       .push(
              //         MaterialPageRoute(builder: (context) => Production()),
              //       );
              //   },
              // ),   
              // ImageButton(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.only(top: 0.0),
              //       child: Text(
              //         'Health Monitoring',
              //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
              //       ),
              //     )
              //   ],
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   width: 400,
              //   height: 300,
              //   paddingTop: 5,
              //   pressedImage: Image.asset(
              //     "assets/mhealth.png",
              //   ),
              //   unpressedImage: Image.asset("assets/mhealth.png"),
              //   onTap: () {
              //     Navigator.of(context)
              //       .push(
              //         MaterialPageRoute(builder: (context) => Production()),
              //       );
              //   },
              // ),       
              // ImageButton(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.only(top: 0.0),
              //       child: Text(
              //         'Control',
              //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
              //       ),
              //     )
              //   ],
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   width: 400,
              //   height: 300,
              //   paddingTop: 5,
              //   pressedImage: Image.asset(
              //     "assets/control.png",
              //   ),
              //   unpressedImage: Image.asset("assets/control.png"),
              //   onTap: () {
              //     Navigator.of(context)
              //       .push(
              //         MaterialPageRoute(builder: (context) => Production()),
              //       );
              //   },
              // ),           
                RaisedButton(
                  color: Colors.grey[400],
                  child: Text(
                    'Production Monitoring',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  onPressed:() {
                    Navigator.of(context)
                    .push(
                      MaterialPageRoute(builder: (context) => Production()),
                    );
                  }
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.grey[400],
                  child: Text(
                    'Monitoring Health',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  onPressed:() {
                    Navigator.of(context)
                    .push(
                      MaterialPageRoute(builder: (context) => Health()),
                    );
                  }
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.grey[400],
                  child: Text(
                    'Control',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  onPressed:() {
                    Navigator.of(context)
                    .push(
                      MaterialPageRoute(builder: (context) => Control()),
                    );
                  }
                ),
              ]  
            ), 
        ),
      ),
    );
  }
}