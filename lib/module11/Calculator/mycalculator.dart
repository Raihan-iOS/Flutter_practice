import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:widget_app_structure/module11/Calculator/widget/BuildButton.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _input = '0';
  String _output = '0';
  String _operator = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String buttonText) {
    print('ibt value: $buttonText');
    setState(() {
      if (buttonText == 'C') {
        _input = '0';
        _output = '0';
        _operator = '';
        num1 = 0;
        num2 = 0;
      } else if (buttonText == '=') {
        num2 = double.parse(_input);
        if (_operator == '+') {
          _output = (num1 + num2).toString();
        } else if (_operator == '-') {
          _output = (num1 - num2).toString();
        } else if (_operator == 'x') {
          _output = (num1 * num2).toString();
        } else if (_operator == '÷') {
          _output = num2 != 0 ? (num1 / num2).toString() : 'Error';
        }
      } else if (['+', '-', 'x', '÷'].contains(buttonText)) {
        if (_input != '0') {
          num1 = double.parse(_input);
        }
        _operator = buttonText;
        _input = '0';
      } else {
        if (_input == '0') {
          _input = buttonText;
        } else {
          _input += buttonText;
        }
        _output = _input; // Update output to show current input
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('My Calculator'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Text(
                    (_input.isNotEmpty && _operator.isNotEmpty)
                        ? '$num1 $_operator $_input'
                        : _input,
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Text(
                    _output,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              BuildButton(onPressed: () => buttonPressed('7'), buttonText: '7'),
              BuildButton(onPressed: () => buttonPressed('8'), buttonText: '8'),
              BuildButton(onPressed: () => buttonPressed('9'), buttonText: '9'),
              BuildButton(
                onPressed: () => buttonPressed('÷'),
                buttonText: '÷',
                buttonColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(onPressed: () => buttonPressed('4'), buttonText: '4'),
              BuildButton(onPressed: () => buttonPressed('5'), buttonText: '5'),
              BuildButton(onPressed: () => buttonPressed('6'), buttonText: '6'),
              BuildButton(
                onPressed: () => buttonPressed('x'),
                buttonText: 'x',
                buttonColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(onPressed: () => buttonPressed('1'), buttonText: '1'),
              BuildButton(onPressed: () => buttonPressed('2'), buttonText: '2'),
              BuildButton(onPressed: () => buttonPressed('3'), buttonText: '3'),
              BuildButton(
                onPressed: () => buttonPressed('-'),
                buttonText: '-',
                buttonColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              BuildButton(onPressed: () => buttonPressed('C'), buttonText: 'C'),
              BuildButton(onPressed: () => buttonPressed('0'), buttonText: '0'),
              BuildButton(onPressed: () => buttonPressed('='), buttonText: '='),
              BuildButton(
                onPressed: () => buttonPressed('+'),
                buttonText: '+',
                buttonColor: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
