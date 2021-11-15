import 'package:flutter/material.dart';
import 'package:standard_form_calculator/simplecalculator.dart';
import 'package:standard_form_calculator/splash.dart';

void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  SplashScreen(),
    );
  }
}