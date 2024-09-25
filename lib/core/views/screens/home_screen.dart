import 'package:electronic_books/core/views/widgets/card_home.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/slider_app.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../constants/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SilverAppBar(),
          SliderApp(),
          Expanded(
            child: Container(
              height: Dimensions.height(context) -
                  Dimensions.width(context) / 3 * 2,
              width: Dimensions.width(context),
              padding: EdgeInsets.all(10),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/books');
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/books');
                      },
                      child: CardHome(
                        components: [
                          SizedBox(
                              height: Dimensions.width(context) * 0.23,
                              child:
                                  Image(image: AssetImage(Assets.imagesBooks))),
                          TextStyleNoor(
                            text: "قسم الكتب",
                            color: Colors.indigo,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CardHome(
                    components: [
                      SizedBox(
                          height: Dimensions.width(context) * 0.23,
                          child: Image(image: AssetImage(Assets.imagesVideo))),
                      TextStyleNoor(
                        text: "قسم الدروس المرئية",
                        color: Colors.indigo,
                        size: 12,
                      ),
                    ],
                  ),
                  CardHome(
                    components: [
                      SizedBox(
                          height: Dimensions.width(context) * 0.23,
                          child: Image(image: AssetImage(Assets.imagesVolume))),
                      TextStyleNoor(
                        text: "قسم الدروس الصوتية",
                        color: Colors.indigo,
                        size: 12,
                      ),
                    ],
                  ),
                  CardHome(
                    components: [
                      SizedBox(
                          height: Dimensions.width(context) * 0.23,
                          child:
                              Image(image: AssetImage(Assets.imagesWriting))),
                      TextStyleNoor(
                        text: "قسم الفتاوى",
                        color: Colors.indigo,
                        size: 12,
                      ),
                    ],
                  ),
                  CardHome(
                    components: [
                      SizedBox(
                          height: Dimensions.width(context) * 0.23,
                          child: Image(image: AssetImage(Assets.imagesNote))),
                      TextStyleNoor(
                        text: "قسم المقالات",
                        color: Colors.indigo,
                        size: 12,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: CardHome(
                      components: [
                        Container(
                          height: Dimensions.width(context) * 0.23,
                          width: Dimensions.width(context) * 0.23,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(Assets.imagesOmerBawazir))),
                        ),
                        TextStyleNoor(
                          text: "نبذة عن الشيخ",
                          color: Colors.indigo,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
