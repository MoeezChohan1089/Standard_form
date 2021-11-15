import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:standard_form_calculator/simplecalculator.dart';

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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Result",  style: TextStyle(color: Colors.black, fontFamily: 'Basic_family'),), backgroundColor: Colors.white, centerTitle: true, elevation: 0,
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
                  "Calculate Another",
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
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF8D00AF),
              ),

              padding: EdgeInsets.all(11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                      Text("Standard Form", style: TextStyle(fontSize: 18,fontFamily: 'Basic_family', color: Colors.white),),
                          Row(
                            children: [
                              Container(
                                width: 260,
                                padding: EdgeInsets.only(top:10),
                                margin: EdgeInsets.only(top:2, ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    //  color: Colors.white
                                    color: Color(0xFF8D00AF)
                                ),
                                alignment: Alignment.bottomLeft,
                                child: Text(widget.scientific, textAlign: TextAlign.start, style: TextStyle(fontSize: 25, fontFamily: 'Basic_family', color: Colors.white),),
                              ),

                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    // var data = jsonEncode(command.dioError);
                                    // Clipboard.setData(ClipboardData(text: data.toString()));
                                    // snackBar();
                                    Clipboard.setData(ClipboardData(text: "Standard Form: \n ${widget.scientific}"));
                                    final snackBar = SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: const Text('You copied of Standard Form'),
                                      duration: Duration(milliseconds: 300),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFCEFFF),
              ),

              padding: EdgeInsets.all(11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Scientific E-Notation", style: TextStyle( color: Color(0xFF8D00AF),fontSize: 18,fontFamily: 'Basic_family'),),
                Row(
                  children: [
                    Container(
                      width: 260,
                      padding: EdgeInsets.only(top:10, ),
                      margin: EdgeInsets.only(top:2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFFCEFFF)
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(widget.equation, style: TextStyle(fontSize: 25, fontFamily: 'Basic_family'),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {
                          // var data = jsonEncode(command.dioError);
                          // Clipboard.setData(ClipboardData(text: data.toString()));
                          // snackBar();
                          Clipboard.setData(ClipboardData(text: "Scientific E-Notation: \n ${widget.equation}"));
                          final snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: const Text('You copied of E-Notation'),
                            duration: Duration(milliseconds: 300),
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

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 14, left: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFCEFFF),
              ),

              padding: EdgeInsets.all(11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Engineering Notation", style: TextStyle(color: Color(0xFF8D00AF), fontSize: 18,fontFamily: 'Basic_family'),),
                  Row(
                    children: [
                      Container(
                        width: 260,
                        padding: EdgeInsets.only(top:10),
                        margin: EdgeInsets.only(top:2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFCEFFF)
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(widget.engineering, style: TextStyle(fontSize: 25, fontFamily: 'Basic_family'),),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        alignment: Alignment.topRight,
                        child: IconButton(
                          alignment: Alignment.topRight,
                          onPressed: () {
                            // var data = jsonEncode(command.dioError);
                            // Clipboard.setData(ClipboardData(text: data.toString()));
                            // snackBar();
                            Clipboard.setData(ClipboardData(text: "Engineering Notation: \n ${widget.engineering}"));
                            final snackBar = SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: const Text('You copied of Engineering Notation'),
                              duration: Duration(milliseconds: 300),
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
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 14, left: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFCEFFF),
              ),

              padding: EdgeInsets.all(11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Real Number", style: TextStyle(color: Color(0xFF8D00AF), fontSize: 18,fontFamily: 'Basic_family'),),
                 Row(
                   children: [
                     Container(
                       width: 260,
                       padding: EdgeInsets.only(top:10),
                       margin: EdgeInsets.only(top:2),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Color(0xFFFCEFFF)
                       ),
                       alignment: Alignment.centerLeft,
                       child: Text(widget.real, style: TextStyle(fontSize: 25, fontFamily: 'Basic_family' ),),
                     ),
                     Container(
                       margin: EdgeInsets.only(bottom: 6),
                       alignment: Alignment.topRight,
                       child: IconButton(
                         alignment: Alignment.topRight,
                         onPressed: () {
                           // var data = jsonEncode(command.dioError);
                           // Clipboard.setData(ClipboardData(text: data.toString()));
                           // snackBar();
                           Clipboard.setData(ClipboardData(text: "Real Number: \n ${widget.real}"));
                           final snackBar = SnackBar(
                             behavior: SnackBarBehavior.floating,
                             content: const Text('You copied of Real Number'),
                             duration: Duration(milliseconds: 300),
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
                 )
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}