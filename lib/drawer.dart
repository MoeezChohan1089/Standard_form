import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );
  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
      print("package info $_packageInfo");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0.0,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Card(
                color: const Color(0xFFFCEFFF),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  minLeadingWidth: 0.0,
                  leading: Image.asset('assets/splashIcon.webp', height: 40),
                  title: Text(
                    AppLocalizations.of(context)!.appTitle,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  subtitle: Text(AppLocalizations.of(context)!.appVersion+' ${_packageInfo.version}'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Card(
                color: const Color(0xffF2F2F2),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: (){
                    try {
                      Navigator.pop(context);
                      // iOS
                      if (Platform.isIOS) {
                        Share.share(
                            AppLocalizations.of(context)!.appHey+'!= https://apps.apple.com/us/app/1595532933');
                      }
                      // Android
                      if (Platform.isAndroid) {
                        Share.share(
                            AppLocalizations.of(context)!.appHey+'!= https://play.google.com/store/apps/details?id=com.et.standard.form.calculator.converter');
                      }
                    } catch (e) {
                      print("error $e");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 20,),
                        Text(AppLocalizations.of(context)!.appShare,style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt', fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Card(
                color: const Color(0xffF2F2F2),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:InkWell(
                  onTap: (){
                    if (Platform.isIOS) {
                      launch("https://apps.apple.com/us/app/1595532933");
                    }
                    // Android
                    if (Platform.isAndroid) {
                      launch(
                          "https://play.google.com/store/apps/details?id=com.et.standard.form.calculator.converter");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/ic_rate_us.webp',height: 25,),
                        SizedBox(width: 20,),
                        Text(AppLocalizations.of(context)!.appRate,style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Card(
                color: const Color(0xffF2F2F2),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: (){
                    final Uri params = Uri(
                      scheme: 'mailto',
                      path: 'ukomrt@gmail.com',
                      query: 'subject=Standard Form Calculator Feedback',);
                    launchURL(params.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/ic_feedback.webp',height: 25,),
                        SizedBox(width: 20,),
                        Text(AppLocalizations.of(context)!.appFeedback,style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Card(
                color: const Color(0xffF2F2F2),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: (){
                    launch("https://calculator-online.net/privacy-policy/");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/ic_privacy_policy.webp',height: 25,),
                        SizedBox(width: 20,),
                        Text(AppLocalizations.of(context)!.appPrivacy,style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
            ],
          ),
        ),
      ),
    );
  }
}