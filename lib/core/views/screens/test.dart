import 'package:electronic_books/core/views/widgets/book_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.indigo[300],
      body: Center(
        child: BookStyle(
          image: AssetImage(Assets.imagesBook),
        ),
      ),
    ));
  }
}
