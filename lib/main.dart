import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Zarla"),
          backgroundColor: Colors.white,
        ),
        body: DicePage(),
      ),
    )
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset("images/1.png"),
        ),
        Expanded(
          child: Image.asset("images/1.png"),
        ),
      ],
    );
  }
}

