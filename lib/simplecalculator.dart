import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:standard_form_calculator/drawer.dart';
import 'package:standard_form_calculator/new_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

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
  late TextEditingController textEditingController = TextEditingController(text: '132.220*10^4');
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //share link for android
  //https://play.google.com/store/apps/details?id=com.pdf.converter.editor.jpgtopdf.maker

  @override
  void initState() {
    super.initState();
    textEditing = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    textEditing.dispose();
    super.dispose();
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        textEditingController.text = "";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        //  textEditingController.text = textEditingController.text.substring(0, textEditingController.selection.base.offset - 1);
        if (textEditingController.text == '') {}
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (textEditingController.text.isEmpty) {
          textEditingController.text = buttonText;
        } else {
          insertText(buttonText);
        }
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: InkWell(
        child: Container(
         // height: MediaQuery.of(context).size.height * 0.08,
          //   width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(4),
        //  margin: EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),),
        ),
        onTap: (){
          buttonPressed(buttonText);
        },
      ),
    );
  }

  Widget zeroButton(String buttonText) {
    return Expanded(
      child: InkWell(
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.08,
            // width: MediaQuery.of(context).size.width * 0.44,
          padding: EdgeInsets.all(4),
          //  margin: EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
            ),),
        ),
        onTap: (){
          buttonPressed(buttonText);
        },
      ),
    );
  }

  Widget clickButton(String buttonTextt, Color buttonColor) {
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
                  style: BorderStyle.solid)),
          onPressed: () => Buildpressed(buttonTextt),
          child: Text(
            buttonTextt,
            style: TextStyle(
                fontFamily: "Basic_family",
                fontSize: 23.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  Buildpressed(String buttonTextt) {
    if (textEditingController.text == '') {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(AppLocalizations.of(context)!.appHeading),
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
    } else if (buttonTextt == AppLocalizations.of(context)!.appCalculate) {
      try {
        equationFontSize = 25.0;
        resultFontSize = 35.0;
        expression = textEditingController.text;

        if (textEditingController.text != '') {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          double results = exp.evaluate(EvaluationType.REAL, cm);

          // Scientific Notation, Engineering
          //  String resu = results.toStringAsExponential(3).replaceAll('e', ' x 10^');
          //   resulttt = resulttt.replaceAll('+', '');
          //   print("result is scientific: $resulttt");

          String resu =
              results.toStringAsExponential(3).replaceAll('e', ' x 10^');
          List<String> zeroc = resu.toString().split('.');
          var tempp = zeroc[1].split('^');
          print("calling pr: ${zeroc[0]}");
          String thisis = tempp[1][tempp.length - 1];
          double b = 1;
          double called_val = double.parse(thisis) - b;
          //   print('Length: ${zeroc[0]}');
          if (textEditingController.text.length < 0) {
            resulttt = '0.' +
                zeroc[0] +
                zeroc[1][0] +
                zeroc[1][1] +
                ' x 10^' +
                called_val.toString().replaceAll('.0', '');
            resulttt = resulttt.replaceAll('+', '');
            print(
                'zero call: ${'0.' + zeroc[0] + zeroc[1][0] + zeroc[1][1] + 'x10^' + called_val.toString().replaceAll('.0', '')}');
          } else {
            resulttt =
                results.toStringAsExponential(3).replaceAll('e', 'x10^');
            resulttt = resulttt.replaceAll('+', '');
          }

          // e Notation

          String resultss = '${exp.evaluate(EvaluationType.REAL, cm)}';
          resultt = double.parse(resultss).toStringAsExponential(3);

          print("result is e-Notation: $resultt");

          // Engineering Notation

          double resultsss = exp.evaluate(EvaluationType.REAL, cm);
          String scien =
              resultsss.toStringAsExponential(3).replaceAll('e', 'x10^');
          List<String> call = scien.toString().split('.');
          print(call[0]);
          double a = 2;
          var temp = call[1].split('^');
          String splitform = temp[temp.length - 1];
          double valueee = double.parse(splitform) - a;
          resultttt = call[0] +
              call[1][0] +
              call[1][1] +
              '.' +
              call[1][2] +
              'x10^' +
              valueee.toString().replaceAll('.0', '');
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
            MaterialPageRoute(
                builder: (context) => new_page(
                      equation: resultt,
                      real: result,
                      scientific: resulttt,
                      engineering: resultttt,
                    )),
          );
        }
      } catch (e) {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(AppLocalizations.of(context)!.appHint),
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
        text: textEditingController.text
            .replaceRange(max(cursorPos, 1), max(cursorPos, 1), insert),
        selection: TextSelection.fromPosition(
            TextPosition(offset: max(cursorPos, 1) + insert.length)));
  }

  void removeText() {
    var cursorPos = textEditingController.selection.base.offset;
    final value = textEditingController.text.substring(0, cursorPos - 1);
    String suffixText = textEditingController.text
        .substring(cursorPos); // text on right side of cursor
    textEditingController.value = TextEditingValue(
        text: value + suffixText,
        selection: TextSelection.collapsed(offset: value.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TextStyle(color: Colors.black, fontFamily: 'Basic_family'),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(icon: Image.asset('assets/ic_drawer.webp',height: 22,width: 22,color: const Color(0xFF8D00AF)), onPressed: ()=> scaffoldKey.currentState!.openDrawer()),
      ),

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
                  Text(
                    AppLocalizations.of(context)!.appEquation,
                    style: TextStyle(fontSize: 18, fontFamily: 'Basic_family'),
                  ),
                  Container(
                    //padding: EdgeInsets.all(13),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
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
            SizedBox(
              height: 110,
            ),

            clickButton(AppLocalizations.of(context)!.appCalculate, Colors.white),
            Expanded(
              child: Container(
               // width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(6),
                color: Color(0xffF2F2F2),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          buildButton('('),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton(")",),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: InkWell(
                                child: Container(
                                  //  height: MediaQuery.of(context).size.height * 0.08,
                                  padding: EdgeInsets.all(10),
                                  //   margin: EdgeInsets.symmetric(vertical: 3, ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset('assets/ic_backspace.webp' ,color: Color(0xFF8D00AF),),
                                ),
                                onTap: () {
                                  setState(() {
                                    removeText();
                                  });
                                }
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          zeroButton("C",),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          buildButton('7'),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("8",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("9",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("*",),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          buildButton('4'),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("5",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("6",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("+",),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          buildButton('1'),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("2",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("3",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("-",),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          buildButton("0"),
                          SizedBox(
                            width: 6,
                          ),
                         buildButton(".",),
                         SizedBox(
                           width: 6,
                         ),
                         buildButton("^",),
                          SizedBox(
                            width: 6,
                          ),
                          buildButton("/",),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: Container(
        color: const Color(0xFFF2F2F2),
        child: const SafeArea(
          child: SizedBox(),
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw AppLocalizations.of(context)!.appLaunch+'$url';
    }
  }
}
