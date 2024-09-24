import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/constants/imageApp.dart';
import 'package:electronic_books/core/views/widgets/search_text_field.dart';
import 'package:flutter/cupertino.dart';

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.width(context) / 3,
      width: Dimensions.width(context),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageApp.shaikhAppBar()), fit: BoxFit.fill),
      ),
    );
  }
}
