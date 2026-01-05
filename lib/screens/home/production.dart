import 'package:flutter/material.dart';
import 'package:monitoring_and_control_app/shared/constants.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:monitoring_and_control_app/screens/home/home.dart';

class Production extends StatefulWidget {
  @override
  _ProductionState createState() => _ProductionState();
}



class _ProductionState extends State<Production> {
  //Text fields
  String startdate = "";  
  String end = "";
  String time = "";

  //Global form key
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Production Monitoring"),
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
        decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Start Date"),
                validator: (val) => val.isEmpty ? "Start Date":null ,
                onChanged: (val){
                  setState(() => startdate = val);                
                } 
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "End Date"),
                  validator: (val) => val.isEmpty ? "End Date":null ,
                  onChanged: (val){
                    setState(() => end = val);                
                  } 
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Time"),
                  validator: (val) => val.isEmpty ? "Time":null ,
                  onChanged: (val){
                    setState(() => time = val);                
                  } 
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.grey[400],
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (){},
                ),
            ],
          ),
        ),
      ),
    );
  }
}