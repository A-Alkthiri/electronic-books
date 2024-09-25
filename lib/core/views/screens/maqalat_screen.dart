import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/search_text_field.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/material.dart';

class MaqalatScreen extends StatelessWidget {
  const MaqalatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBackground),
                  fit: BoxFit.fill)),
          height: Dimensions.height(context),
          width: Dimensions.width(context),
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
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "عنوان المقال",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'noor',
                          fontSize: Dimensions.width(context) * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          "المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى المحتوى ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'noor',
                            fontSize: Dimensions.width(context) * 0.04,
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
