import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        if (equation.length > 1) {
          equation = equation.substring(0, equation.length - 1);
        } else {
          equation = "0";
        }
      } else if (buttonText == "+/-") {
        if (equation.isNotEmpty && equation != "0") {
          if (equation[0] == '-') {
            equation = equation.substring(1);
          } else {
            equation = '-$equation';
          }
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          GrammarParser p = GrammarParser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

          // Format result to remove unnecessary decimals
          double resultValue = double.parse(result);
          if (resultValue == resultValue.toInt()) {
            result = resultValue.toInt().toString();
          } else {
            result = resultValue
                .toStringAsFixed(8)
                .replaceAll(RegExp(r'0*$'), '')
                .replaceAll(RegExp(r'\.$'), '');
          }
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget calculatorButton(
    String btnText,
    Color btnColor,
    Color textColor, {
    double? fontSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: btnColor.withValues(alpha: 0.4),
            blurRadius: 15,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [btnColor.withValues(alpha: 0.95), btnColor],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => buttonPressed(btnText),
          borderRadius: BorderRadius.circular(18),
          splashColor: Colors.white.withValues(alpha: 0.3),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          child: Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            child: Text(
              btnText,
              style: TextStyle(
                fontSize: fontSize ?? 20,
                color: textColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2C3E2C),
              Color(0xFF3D5A40),
              Color(0xFF4A6741),
              Color(0xFF556B52),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Simple App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              // Display Area
              Container(
                constraints: BoxConstraints(minHeight: 140, maxHeight: 160),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.15),
                      Colors.white.withValues(alpha: 0.05),
                    ],
                  ),
                  border: Border.all(
                    color: Color(0xFF9CAF88).withValues(alpha: 0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF9CAF88).withValues(alpha: 0.3),
                      blurRadius: 25,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Equation Display
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(
                            equation,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Result Display
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(
                            result,
                            style: TextStyle(
                              color: Color(0xFF9CAF88),
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  color: Color(
                                    0xFF9CAF88,
                                  ).withValues(alpha: 0.6),
                                  blurRadius: 25,
                                ),
                                Shadow(
                                  color: Color(
                                    0xFF9CAF88,
                                  ).withValues(alpha: 0.3),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Buttons Area
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        // Clear & Operations Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            calculatorButton(
                              "C",
                              Color(0xFF6B8E6B),
                              Colors.white,
                              fontSize: 22,
                            ),
                            calculatorButton(
                              "⌫",
                              Color(0xFF6B8E6B),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "%",
                              Color(0xFF6B8E6B),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "÷",
                              Color(0xFF87A96B),
                              Colors.white,
                              fontSize: 28,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Numbers Row 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            calculatorButton(
                              "7",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "8",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "9",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "×",
                              Color(0xFF87A96B),
                              Colors.white,
                              fontSize: 24,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Numbers Row 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            calculatorButton(
                              "4",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "5",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "6",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "-",
                              Color(0xFF87A96B),
                              Colors.white,
                              fontSize: 28,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Numbers Row 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            calculatorButton(
                              "1",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "2",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "3",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              "+",
                              Color(0xFF87A96B),
                              Colors.white,
                              fontSize: 26,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Bottom Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            calculatorButton(
                              "0",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 24,
                            ),
                            calculatorButton(
                              ".",
                              Color(0xFF4A5D4A),
                              Colors.white,
                              fontSize: 28,
                            ),
                            calculatorButton(
                              "+/-",
                              Color(0xFF6B8E6B),
                              Colors.white,
                              fontSize: 20,
                            ),
                            calculatorButton(
                              "=",
                              Color(0xFF87A96B),
                              Colors.white,
                              fontSize: 26,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
