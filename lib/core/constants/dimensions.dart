import 'package:flutter/cupertino.dart';

class Dimensions {
  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
