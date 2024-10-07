import 'package:electronic_books/core/views/widgets/dialog_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _currentOpenIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.indigo[300], body: Center()));
  }
}
