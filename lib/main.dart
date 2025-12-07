import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '';
  double sum = 0;

  void onPress(String value) {
    setState(() {
      // Clear
      if (value == 'C') {
        display = '';
        sum = 0;
      }
      // Backspace
      else if (value == '<-') {
        if (display.isNotEmpty) {
          display = display.substring(0, display.length - 1);
        }
      }
      // SUM ONLY LOGIC
      else if (value == '+') {
        if (display.isNotEmpty) {
          sum += double.tryParse(display) ?? 0;
          display = '';
        }
      }
      // Equals = show sum only
      else if (value == '=') {
        display = sum.toString();
        sum = 0;
      }
      // Numbers and dot only go to display
      else if (RegExp(r'[0-9.]').hasMatch(value)) {
        display += value;
      }
      // Disable other operators (* / - %)
      else {
        // do nothing
      }
    });
  }

  Widget buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => onPress(text),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(16),
            height: 100,
            child: Text(display, style: const TextStyle(fontSize: 32)),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                buildButton('C'),
                buildButton('*'),
                buildButton('/'),
                buildButton('<-'),
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('+'),
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('-'),
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('*'),
                buildButton('%'),
                buildButton('0'),
                buildButton('.'),
                buildButton('='),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
