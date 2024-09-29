import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:flutter/material.dart';

import '../../models/ads.dart';

class SliderApp extends StatelessWidget {
  SliderApp({super.key, required this.allAds});
  List<Ads> allAds;
  @override
  Widget build(BuildContext context) {
    return allAds.isNotEmpty
        ? Container(
            height: Dimensions.width(context) / 3,
            width: Dimensions.width(context),
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
            ),
            child: CarouselSlider.builder(
              itemCount: allAds.length,
              itemBuilder: (context, index, realIndex) => SizedBox(
                height: Dimensions.width(context) / 3,
                width: Dimensions.width(context),
                child: Image(
                  image: NetworkImage(allAds[index].imageUrl!),
                  fit: BoxFit.fill,
                ),
              ),
              options: CarouselOptions(
                height: Dimensions.width(context) / 3,
                autoPlay: true,
              ),
            ))
        : Container();
  }
}
