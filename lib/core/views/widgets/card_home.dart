import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
   CardHome({super.key,required this.components});
   List<Widget>components ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: components,
      ),
    );
  }
}
