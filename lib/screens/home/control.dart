import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Control"),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          // actions: <Widget>[
          //   FlatButton.icon(
          //     icon: Icon(Icons.arrow_back),
          //     label: Text('Back'),
          //     onPressed: () {
          //           Navigator.of(context)
          //           .push(
          //             MaterialPageRoute(builder: (context) => Home()),
          //           );
          //         }
          //   ),
          // ]  
      ),        
      body: Container(
        child: Text("Control"),
        decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
      ),
    ); 
  }
}