import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/constants/imageApp.dart';
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
                image: AssetImage(ImageApp.muhadhra()),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: Dimensions.width(context) / 3,
              width: Dimensions.width(context),
              child: Image(
                image: AssetImage(ImageApp.muhadhra2()),
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
