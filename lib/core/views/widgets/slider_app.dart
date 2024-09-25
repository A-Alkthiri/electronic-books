import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/material.dart';

class SliderApp extends StatelessWidget {
  const SliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimensions.width(context) / 3,
        width: Dimensions.width(context),
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
        ),
        child: CarouselSlider(
          items: [
            Container(
              height: Dimensions.width(context) / 3,
              width: Dimensions.width(context),
              child: Image(
                image: AssetImage(Assets.imagesMuhadhra),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: Dimensions.width(context) / 3,
              width: Dimensions.width(context),
              child: Image(
                image: AssetImage(Assets.imagesMuhadhra2),
                fit: BoxFit.fill,
              ),
            )
          ],
          options: CarouselOptions(
            height: Dimensions.width(context) / 3,
            autoPlay: true,
          ),
        ));
  }
}
