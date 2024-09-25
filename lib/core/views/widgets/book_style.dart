import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookStyle extends StatelessWidget {
  BookStyle({super.key, required this.image});

  ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 10),
          ),
        ],
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
    );
    ;
  }
}
