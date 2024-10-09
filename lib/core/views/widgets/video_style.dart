import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/models/content.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoStyle extends StatelessWidget {
  VideoStyle({super.key, required this.content});

  Content content;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(content.imagePath!),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Icon(
            Icons.play_circle_outline,
            color: Colors.black.withOpacity(0.6),
            size: Dimensions.width(context) * 0.15,
          ),
          Container(
            width: Dimensions.width(context) / 2,
            height: Dimensions.height(context) * 0.04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(18, 125, 255, 0.5),
                      Color.fromRGBO(18, 125, 255, 0.55),
                    ])),
            child: Center(child: TextStyleNoor(text: content.title!)),
          ),
        ],
      ),
    );
  }
}
