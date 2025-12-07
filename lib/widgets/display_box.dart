import 'package:flutter/material.dart';

class DisplayBox extends StatelessWidget {
  final String text;

  const DisplayBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(16),
      height: 100,
      child: Text(text, style: const TextStyle(fontSize: 32)),
    );
  }
}
