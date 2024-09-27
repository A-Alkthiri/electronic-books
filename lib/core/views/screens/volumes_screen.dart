import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/material.dart';

class VolumesScreen extends StatelessWidget {
  const VolumesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Dimensions.width(context) * 0.15,
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
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesBackground),
                      fit: BoxFit.cover,
                      opacity: 0.5)),
              height:
                  Dimensions.height(context) - Dimensions.width(context) * 0.3,
              width: Dimensions.width(context),
              child: ListView.builder(itemBuilder: (ctx, index) {
                return ListTile(
                  leading: TextStyleNoor(
                    text: "${index + 1}",
                    size: 20,
                    color: Colors.indigo,
                  ),
                  title: TextStyleNoor(
                    size: 12,
                    text: "عنوان الدرس الصوتي",
                    color: Colors.indigo,
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.play_arrow)),
                );
              })),
        ],
      ),
    ));
  }
}
