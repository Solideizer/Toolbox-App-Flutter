import 'package:flutter/material.dart';
import 'package:flutter_toolbox/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C', // 0
    'DEL', // 1
    '%', // 2
    '/', // 3
    '9', // 4
    '8', // 5
    '7', // 6
    'x', // 7
    '6', // 8
    '5', // 9
    '4', // 10
    '-', // 11
    '3', // 12
    '2', // 13
    '1', // 14
    '+', // 15
    '0', // 16
    '00', // 17
    '.', // 18
    '=', // 19
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 32.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 32.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Clear button
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.black,
                          textColor: Colors.amber,
                          fontSize: 20,
                        );
                        // DEL Button
                      } else if (index == 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.black,
                          textColor: Colors.amber,
                          fontSize: 20,
                        );
                      } // EQUAL Button
                      else if (index == 19) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.black,
                          fontSize: 30,
                        );
                      } else {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).accentColor,
                          textColor: Colors.black,
                          fontSize: isOperator(buttons[index]) ? 30.0 : 20.0,
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }

  bool isOperator(String s) {
    if (s == '%' || s == '/' || s == 'x' || s == '-' || s == '+' || s == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
