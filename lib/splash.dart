import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:standard_form_calculator/simplecalculator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SimpleCalculator())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF8D00AF),
      body: Container(
        decoration: new BoxDecoration(
      image: new DecorationImage(
      image: new AssetImage("assets/splash_screen.png"),
      fit: BoxFit.fill,
    ),
    ),
  child: null,
  //       child: Column(
  //       //  mainAxisAlignment: MainAxisAlignment.center,
  //      //   crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //
  // //            Text("Standard From Calculator", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, color: Colors.white,  fontFamily: "Basic_family",),),
  //         ],
  //       ),
        ),
    );
  }
}