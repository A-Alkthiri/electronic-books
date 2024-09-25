import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/book_style.dart';
import 'package:electronic_books/core/views/widgets/search_text_field.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.indigo[200],
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SilverAppBar(),
                Positioned(
                    right: Dimensions.width(context) / 6,
                    top: Dimensions.width(context) / 3 - 20,
                    child: SearchTextField()),
              ],
            ),
            SizedBox(
              height: Dimensions.width(context) * 0.08,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width:
                  Dimensions.width(context) - Dimensions.width(context) * 0.1,
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(30)),
              child: TabBar(tabs: [
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
              ]),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     TextStyleNoor(
              //       text: "الكل",
              //       color: Colors.indigo,
              //     ),
              //     TextStyleNoor(
              //       text: "عقيدة",
              //       color: Colors.indigo,
              //     ),
              //     TextStyleNoor(
              //       text: "فقه",
              //       color: Colors.indigo,
              //     ),
              //     TextStyleNoor(
              //       text: "حديث",
              //       color: Colors.indigo,
              //     ),
              //     TextStyleNoor(
              //       text: "سيرة",
              //       color: Colors.indigo,
              //     ),
              //   ],
              // ),
            ),
            SizedBox(
              height: Dimensions.width(context) * 0.04,
            ),
            Expanded(
              child: Container(
                width: Dimensions.width(context) - 20,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: Dimensions.height(context) -
                    Dimensions.width(context) * 0.5,
                decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    borderRadius: BorderRadius.circular(10)),
                child: TabBarView(
                  children: [
                    GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                            child: BookStyle(
                                image: AssetImage(Assets.imagesBook)));
                      },
                    ),
                    GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                            child: BookStyle(
                                image: AssetImage(Assets.imagesBook)));
                      },
                    ),
                    GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                            child: BookStyle(
                                image: AssetImage(Assets.imagesBook)));
                      },
                    ),
                    GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                            child: BookStyle(
                                image: AssetImage(Assets.imagesBook)));
                      },
                    ),
                    GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                            child: BookStyle(
                                image: AssetImage(Assets.imagesBook)));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
