import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/search_text_field.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.indigo[200],
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SilverAppBar(),
          Positioned(
              right: Dimensions.width(context) / 6,
              top: Dimensions.width(context) / 3 - 20,
              child: SearchTextField()),
          Positioned(
            top: Dimensions.width(context) * 0.40,
            right: Dimensions.width(context) * 0.06,
            child: Container(
              height: 30,
              width:
                  Dimensions.width(context) - Dimensions.width(context) * 0.12,
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextStyleNoor(
                    text: "الكل",
                    color: Colors.indigo,
                  ),
                  TextStyleNoor(
                    text: "عقيدة",
                    color: Colors.indigo,
                  ),
                  TextStyleNoor(
                    text: "فقه",
                    color: Colors.indigo,
                  ),
                  TextStyleNoor(
                    text: "حديث",
                    color: Colors.indigo,
                  ),
                  TextStyleNoor(
                    text: "سيرة",
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Dimensions.width(context) / 2,
            child: Container(
              width: Dimensions.width(context) - 20,
              margin: EdgeInsets.all(10),
              height:
                  Dimensions.height(context) - Dimensions.width(context) * 0.5,
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    ));
  }
}
