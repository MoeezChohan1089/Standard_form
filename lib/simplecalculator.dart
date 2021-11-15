import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:standard_form_calculator/new_page.dart';

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class SimpleCalculator extends StatefulWidget {

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  late FocusNode textEditing;
  String result = "0";
  String resultt = '';
  String resulttt = '';
  String resultttt = '';
  String expression = "";
  double equationFontSize = 30.0;
  double resultFontSize = 48.0;
  late TextEditingController textEditingController = TextEditingController();


  void initState() {
    super.initState();
    textEditing = FocusNode();
  }
  @override void dispose() {
    // Clean up the focus node when the Form is disposed.
    textEditing.dispose();
    super.dispose();
  }

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        textEditingController.text = "";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
      //  textEditingController.text = textEditingController.text.substring(0, textEditingController.selection.base.offset - 1);
        removeText(buttonText);
        if(textEditingController.text==''){
        }
      }
      else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(textEditingController.text.isEmpty){
          textEditingController.text = buttonText;
        }else{
          insertText(buttonText);
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor,Color textColor){
    return Container(
      width: MediaQuery.of(context).size.height * 0.11 * buttonHeight,
      height: MediaQuery.of(context).size.height * 0.092,
      margin: EdgeInsets.only(top:2),
      padding: EdgeInsets.all(8),
      color: Colors.transparent,
      child: FlatButton(
        color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          padding: EdgeInsets.all(5.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.normal,
                color: textColor
            ),
          )
      ),
    );
  }
  Widget clickButton(String buttonTextt, Color buttonColor){
    return Container(

    //  margin: EdgeInsets.only(top:40),
      width: MediaQuery.of(context).size.width * 0.97,
      height: MediaQuery.of(context).size.height * 0.09,
      padding: EdgeInsets.all(6),
      color: buttonColor,
      child: FlatButton(
        color: Color(0xFF8D00AF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: Color(0xFF8D00AF),
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          onPressed: () => Buildpressed(buttonTextt),
          child: Text(
            buttonTextt,
            style: TextStyle(
              fontFamily: "Basic_family",
                fontSize: 23.0,
                fontWeight: FontWeight.normal,
                color: Colors.white
            ),
          )
      ),
    );
  }
  

  Buildpressed(String buttonTextt){
    if(textEditingController.text == ''){
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text('Please Enter Your Equation'),
        duration: Duration(milliseconds: 900),
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
    }
    else if(buttonTextt == "Calculate"){
      try{
        equationFontSize = 25.0;
        resultFontSize = 35.0;
        expression = textEditingController.text;

        if(textEditingController.text != ''){
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            double results = exp.evaluate(EvaluationType.REAL, cm);

            // Scientific Notation, Engineering
            //  String resu = results.toStringAsExponential(3).replaceAll('e', ' x 10^');
            //   resulttt = resulttt.replaceAll('+', '');
            //   print("result is scientific: $resulttt");

            String resu = results.toStringAsExponential(3).replaceAll('e', ' x 10^');
            List<String> zeroc = resu.toString().split('.');
            var tempp = zeroc[1].split('^');
            print("calling pr: ${zeroc[0]}");
            String thisis = tempp[1][tempp.length-1];
            double b = 1;
            double called_val = double.parse(thisis)-b;
         //   print('Length: ${zeroc[0]}');
              if(textEditingController.text.length < 0){

                resulttt = '0.' + zeroc[0] + zeroc[1][0] + zeroc[1][1] + ' x 10^' + called_val.toString().replaceAll('.0', '');
                resulttt = resulttt.replaceAll('+', '');
                print('zero call: ${'0.' + zeroc[0] + zeroc[1][0] + zeroc[1][1] + ' x 10^' + called_val.toString().replaceAll('.0', '')}');
              }
              else{
                resulttt = results.toStringAsExponential(3).replaceAll('e', ' x 10^');
                resulttt = resulttt.replaceAll('+', '');
              }

            // e Notation

            String resultss = '${exp.evaluate(EvaluationType.REAL, cm)}';
            resultt = double.parse(resultss).toStringAsExponential(3);

            print("result is e-Notation: $resultt");

            // Engineering Notation

            double resultsss = exp.evaluate(EvaluationType.REAL, cm);
            String scien = resultsss.toStringAsExponential(3).replaceAll('e', ' x 10^');
            List<String> call = scien.toString().split('.');
            print(call[0]);
            double a = 2;
            var temp = call[1].split('^');
            String splitform = temp[temp.length-1];
              double valueee = double.parse(splitform) - a;
              resultttt = call[0] + call[1][0] + call[1][1] + '.' + call[1][2] + ' x 10^' + valueee.toString().replaceAll('.0', '');
            resultttt = resultttt.replaceAll('+', '');

            print("Engineering Notation: $resultttt");

            // Real Number

            expression = expression.replaceAll('×', '*');
            expression = expression.replaceAll('÷', '/');
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
            result = result.replaceAll('.0', '');
            print('result of real-Number: $result');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  new_page(equation: resultt,
                    real: result,
                    scientific: resulttt,
                    engineering: resultttt,)),
            );
        }
      }
      catch(e){
          final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Text('Your Equation Is Wrong'),
          duration: Duration(milliseconds: 900),
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
      }
    }
  }

  // void insertText(String inserted) {
  //   final text = textEditingController.text;
  //   final selection = textEditingController.selection;
  //   final newText = text.replaceRange(selection.start, selection.end, inserted);
  //   textEditingController.value = TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: selection.baseOffset + inserted.length),
  //   );
  // }

  void insertText(String insert) {
    final int cursorPos = textEditingController.selection.base.offset;
    textEditingController.value = textEditingController.value.copyWith(
        text: textEditingController.text.replaceRange(max(cursorPos, 1), max(cursorPos, 1), insert),
        selection: TextSelection.fromPosition(TextPosition(offset: max(cursorPos, 1) + insert.length))
    );
  }

  void removeText(String remove) {
    var cursorPos = textEditingController.selection.base.offset;
    final value = textEditingController.text.substring(0, cursorPos - 1);
    String suffixText = textEditingController.text.substring(cursorPos); // text on right side of cursor
    textEditingController.value = TextEditingValue(text: value + suffixText, selection: TextSelection.collapsed(offset: value.length));
  }
  @override
  Widget build(BuildContext context) {
    var messageComposeController;
    return Scaffold(
      appBar: AppBar(title: Text('Standard Form Calculator', style: TextStyle(color: Colors.black, fontFamily: 'Basic_family'),), backgroundColor: Colors.white, centerTitle: true, elevation: 0, foregroundColor: Colors.white,),
      body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFCEFFF),
                ),

                padding: EdgeInsets.all(11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter Equation", style: TextStyle(fontSize: 18,fontFamily: 'Basic_family'),),
                    Container(
                      //padding: EdgeInsets.all(13),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(top:8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        readOnly: true,
                        showCursor: true,
                        controller: textEditingController,
                        focusNode: textEditing,
                        autofocus: true,
                        enabled: true,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: '0',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                      // Text(equation, style: TextStyle(fontSize: 20, fontFamily: 'Basic_family'),),
                    ),
                  ],
                ),
              ),


            // Expanded(child: Divider(
            //   color: Colors.white,
            // ),),
              Spacer(),
               clickButton("Calculate", Colors.white),
                Container(
                 // alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top:16,),
                  color: Color(0xFFF2F2F2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildButton("(", 1, Colors.white, Colors.black),
                          buildButton(")", 1, Colors.white, Colors.black),
                          buildButton("C", 1, Colors.white, Colors.black),
                          buildButton("⌫", 1, Colors.white, Color(0xFF8D00AF)),
                        ],
                      ),
                    ),
              Container(
              //  margin: EdgeInsets.only(bottom: 10),
                color: Color(0xFFF2F2F2),
                //width: MediaQuery.of(context).size.width * .50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildButton("7", 1, Colors.white, Colors.black),
                    buildButton("8", 1, Colors.white, Colors.black),
                    buildButton("9", 1, Colors.white, Colors.black),
                    buildButton("*", 1, Colors.white, Colors.black),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFF2F2F2),
                //width: MediaQuery.of(context).size.width * .50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildButton("4", 1, Colors.white, Colors.black),
                    buildButton("5", 1, Colors.white, Colors.black),
                    buildButton("6", 1, Colors.white, Colors.black),
                    buildButton("+", 1, Colors.white, Colors.black),
                  ],
                ),
              ),
              Container(

                color: Color(0xFFF2F2F2),
                //width: MediaQuery.of(context).size.width * .50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildButton("1", 1, Colors.white, Colors.black),
                    buildButton("2", 1, Colors.white, Colors.black),
                    buildButton("3", 1, Colors.white, Colors.black),
                    buildButton("-", 1, Colors.white, Colors.black),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 18,),
                color: Color(0xFFF2F2F2),
                //width: MediaQuery.of(context).size.width * .50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildButton("0", 1, Colors.white, Colors.black),
                    buildButton(".", 1, Colors.white, Colors.black),
                    buildButton("^", 1, Colors.white, Colors.black),
                    buildButton("/", 1, Colors.white, Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}