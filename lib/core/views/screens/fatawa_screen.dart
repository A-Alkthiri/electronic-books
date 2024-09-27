import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/search_text_field.dart';

class FatawaScreen extends StatelessWidget {
  const FatawaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: Dimensions.height(context),
        width: Dimensions.width(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesBackground),
              opacity: 0.5,
              fit: BoxFit.cover),
        ),
        child: Column(
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
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              title: TextStyleNoor(
                                size: 14,
                                text: "عنوان الفتوى",
                                color: Colors.indigo,
                              ),
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                              backgroundColor: Colors.indigo[200],
                              content: SingleChildScrollView(
                                child: TextStyleNoor(
                                    text:
                                        "المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى "),
                              ),
                              actions: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.grey,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          );
                        });
                  },
                  leading: TextStyleNoor(
                    color: Colors.indigo,
                    text: "${index + 1}",
                    size: 20,
                  ),
                  title: TextStyleNoor(
                    size: 14,
                    text: "عنوان الفتوى",
                    color: Colors.indigo,
                  ),
                );
              }),
            )
          ],
        ),
      ),
    ));
  }
}
