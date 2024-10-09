import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleNoor extends StatelessWidget {
  TextStyleNoor(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.size = 10});
  String text;
  Color? color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "noor",
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
