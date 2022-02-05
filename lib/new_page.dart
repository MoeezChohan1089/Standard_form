import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class new_page extends StatefulWidget{
  final String equation;
  final String real;
  final String scientific;
  final String engineering;

  const new_page({Key? key, required this.equation, required this.real, required this.scientific, required this.engineering}) : super(key: key);
  @override
  State<new_page> createState() => _new_pageState();
}

class _new_pageState extends State<new_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appResult,  style: TextStyle(color: Colors.black, fontFamily: 'Basic_family'),), backgroundColor: Colors.white, centerTitle: true, elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF8D00AF)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Container(
            color:Colors.white,
            width: MediaQuery.of(context).size.width * 0.999,
            height: MediaQuery.of(context).size.height * 0.11,
            padding: EdgeInsets.all(15),
            child: FlatButton(
                color: Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Color(0xFFF2F2F2),
                        width: 1,
                        style: BorderStyle.solid
                    )
                ),
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: Text(
                  AppLocalizations.of(context)!.appAnother,
                  style: TextStyle(
                      fontFamily: "Basic_family",
                      fontSize: 23.0,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF8D00AF)
                  ),
                )
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF8D00AF),
              ),

              padding: EdgeInsets.all(11),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.appForm, style: TextStyle(fontSize: 18,fontFamily: 'Basic_family', color: Colors.white),),
                                Container(
                                  //   padding: EdgeInsets.only(top:10),
                                  margin: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //  color: Colors.white
                                      color: Color(0xFF8D00AF)
                                   // color: Colors.black
                                  ),
                                  child: Text(widget.scientific, textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Basic_family', color: Colors.white),),
                                ),
                        ],
                     ),
                          ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: IconButton(
                      onPressed: () {
                        // var data = jsonEncode(command.dioError);
                        // Clipboard.setData(ClipboardData(text: data.toString()));
                        // snackBar();
                        Clipboard.setData(ClipboardData(text: AppLocalizations.of(context)!.appForm+": \n ${widget.scientific}"));
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(AppLocalizations.of(context)!.appFormCop),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      //   label: Text('', style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.copy, color: Colors.white),
                      //textColor: Colors.white,
                      splashColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFCEFFF),
              ),

              padding: EdgeInsets.all(11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.appeNotation, style: TextStyle(fontSize: 18,fontFamily: 'Basic_family', color: Color(0xFF8D00AF)),),
                        Container(
                          //   padding: EdgeInsets.only(top:10),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //  color: Colors.white
                              color: Color(0xFFFCEFFF)
                          ),
                          child: Text(widget.equation, textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Basic_family', color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: IconButton(
                      onPressed: () {
                        // var data = jsonEncode(command.dioError);
                        // Clipboard.setData(ClipboardData(text: data.toString()));
                        // snackBar();
                        Clipboard.setData(ClipboardData(text: AppLocalizations.of(context)!.appeNotation+": \n ${widget.scientific}"));
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(AppLocalizations.of(context)!.appeNotationCop),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      //   label: Text('', style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.copy, color: Color(0xFF8D00AF)),
                      //textColor: Colors.white,
                      splashColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFCEFFF),
              ),

              padding: EdgeInsets.all(11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.appEngineering, style: TextStyle(fontSize: 18,fontFamily: 'Basic_family', color: Color(0xFF8D00AF)),),
                        Container(
                          //   padding: EdgeInsets.only(top:10),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //  color: Colors.white
                              color: Color(0xFFFCEFFF)
                          ),
                          child: Text(widget.engineering, textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Basic_family', color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: IconButton(
                      onPressed: () {
                        // var data = jsonEncode(command.dioError);
                        // Clipboard.setData(ClipboardData(text: data.toString()));
                        // snackBar();
                        Clipboard.setData(ClipboardData(text: AppLocalizations.of(context)!.appEngineering+": \n ${widget.scientific}"));
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(AppLocalizations.of(context)!.appEngineeringCop),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      //   label: Text('', style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.copy, color: Color(0xFF8D00AF)),
                      //textColor: Colors.white,
                      splashColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFCEFFF),
              ),

              padding: EdgeInsets.all(11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.appReal, style: TextStyle(fontSize: 18,fontFamily: 'Basic_family', color: Color(0xFF8D00AF)),),
                        Container(
                          //   padding: EdgeInsets.only(top:10),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //  color: Colors.white
                              color: Color(0xFFFCEFFF)
                          ),
                          child: Text(widget.real, textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Basic_family', color: Colors.black),),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: IconButton(
                      onPressed: () {
                        // var data = jsonEncode(command.dioError);
                        // Clipboard.setData(ClipboardData(text: data.toString()));
                        // snackBar();
                        Clipboard.setData(ClipboardData(text: AppLocalizations.of(context)!.appReal+": \n ${widget.scientific}"));
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(AppLocalizations.of(context)!.appRealCop),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      //   label: Text('', style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.copy, color: Color(0xFF8D00AF)),
                      //textColor: Colors.white,
                      splashColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}