import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.width(context) / 3,
      width: Dimensions.width(context),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
        image: DecorationImage(
            image: AssetImage(Assets.imagesShaikhAppBar), fit: BoxFit.fill),
      ),
    );
  }
}
