import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:standard_form_calculator/simplecalculator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      // bottomNavigationBar: Wrap(
      //   children: [
      //     Container(
      //       color: Colors.transparent,
      //       child: Column(
      //         children: [
      //           Container( margin: EdgeInsets.only(left: 60),child: Center(child: Text("Powered By", style: TextStyle(fontSize: 14, color: Colors.white,  fontFamily: "Basic_family",),))),
      //           Container( margin: EdgeInsets.only(bottom: 12), child: Center(child: Image.asset('assets/ic_eclixtech.png', width:130))),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
        body: Stack(
          children: [
            Image.asset('assets/bg.webp', fit: BoxFit.fill, width: double.infinity, height: MediaQuery.of(context).size.height,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('assets/logo-sf-full.png', width: 140,),
                ),
                Center(
                    child: Text(AppLocalizations.of(context)!.appTitle, textAlign: TextAlign.center,style: TextStyle(fontSize: 22, color: Colors.white,  fontFamily: "Basic_family",),)
                ),
              ],
            ),
            Positioned(
                bottom: 20,
                right: 10,
                left: 10,
                child: Column(
                  children: [
                    Container( margin: EdgeInsets.only(left: 60),child: Center(child: Text(AppLocalizations.of(context)!.appPowered, style: TextStyle(fontSize: 14, color: Colors.white,  fontFamily: "Basic_family",),))),
                    Image.asset('assets/eclixLogo.webp', width:130),
                  ],
                )
            )
          ],
        )
    );
  }
}