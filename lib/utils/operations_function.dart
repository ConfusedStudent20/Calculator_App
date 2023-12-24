import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

TextEditingController userController = TextEditingController();
bool isParenthesisOpen = false;

// switch case to handle the user input
void handleButtonTap(String buttonText) {
  switch (buttonText) {
    case '=':
      calculateResult();
      break;
    case 'x':
      // Handle ' red ⨯' button differently (clear icon)
      handleClearIconTap();
      break;
    case 'AC':
      clearAllOnce();
      break;

    case '( )':
      // Toggle between open and close parentheses
      userController.text += isParenthesisOpen ? ')' : '(';
      isParenthesisOpen = !isParenthesisOpen;
      break;

    case '%':
      handlePercentage();
      break;
    default:
      userController.text += buttonText;
  }
}

// clear the screen number once by once, 'Red *'  action
void handleClearIconTap() {
  String currentText = userController.text;
  if (currentText.isNotEmpty) {
    // Remove the last character in the expression
    userController.text = currentText.substring(0, currentText.length - 1);
  }
}

// clear number in screen at once, 'AC' button action
void clearAllOnce() {
  userController.clear();
  isParenthesisOpen = false; // Reset the parenthesis state
}

// calculate the user given input

//install math_expressions package

void calculateResult() {
  String expression = userController.text;

  try {
    // Use the math_expressions package to parse and evaluate the expression
    Parser p = Parser();
    Expression exp = p.parse(expression);
    // store the expressions
    ContextModel cm = ContextModel();

    double result = exp.evaluate(EvaluationType.REAL, cm);

    if (result % 1 == 0) {
      // show int value if both input and output are int
      userController.text = result.toInt().toString();
    } else {
      userController.text = result.toString();
    }
    isParenthesisOpen = false; // Reset the parenthesis state
  } catch (e) {
    // Handle errors
    userController.text = 'Error';
  }
}

//calculate percentage
void handlePercentage() {
  try {
    double inputValue = double.parse(userController.text);
    double percentageValue = inputValue / 100.0;
    userController.text = percentageValue.toString();
  } catch (e) {
    // Handle errors
    userController.text = 'Error';
  }
}
