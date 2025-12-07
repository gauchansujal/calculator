import 'package:flutter/material.dart';
import '../widgets/display_box.dart';
import '../widgets/calc_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '';
  double sum = 0;

  void onButtonPress(String value) {
    setState(() {
      if (value == 'C') {
        display = '';
        sum = 0;
      } else if (value == '<-') {
        if (display.isNotEmpty) {
          display = display.substring(0, display.length - 1);
        }
      } else if (value == '+') {
        if (display.isNotEmpty) {
          sum += double.tryParse(display) ?? 0;
          display = '';
        }
      } else if (value == '=') {
        display = sum.toString();
        sum = 0;
      } else if (RegExp(r'[0-9.]').hasMatch(value)) {
        display += value;
      }
    });
  }

  Widget buildRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((text) {
          return Expanded(
            child: CalcButton(text: text, onPressed: () => onButtonPress(text)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator App')),
      body: Column(
        children: [
          DisplayBox(text: display),
          buildRow(['C', '*', '/', '<-']),
          buildRow(['1', '2', '3', '+']),
          buildRow(['4', '5', '6', '-']),
          buildRow(['7', '8', '9', '*']),
          buildRow(['%', '0', '.', '=']),
        ],
      ),
    );
  }
}
