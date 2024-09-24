import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 20,
        width: Dimensions.width(context) / 3 * 2,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [],
        ),
        child: TextField(
          style: TextStyle(fontSize: 10),
          decoration: InputDecoration(
            hintText: 'البحث ...',
            hintStyle: TextStyle(fontSize: 10, fontFamily: "noor"),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
