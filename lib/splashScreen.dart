import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),
      ));
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
          ),
          child: Card(
            elevation: 15,
            shadowColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/images/BMI1.png',
              height: 300,
              scale: 2.5,
             ),
            ),
          ),
        ),
      ),
    );
  }
}