import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:flutter/material.dart';

import '../../models/content.dart';

class DialogBook extends StatelessWidget {
  DialogBook({super.key, required this.book});

  Content book;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: TextStyleNoor(
          text: book.title!,
          size: 14,
          color: Colors.indigo,
        ),
        content: TextStyleNoor(
          text: book.description!,
          color: Colors.indigo,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 6, backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/pdf');
                  },
                  child: TextStyleNoor(
                    text: "قراءة",
                    size: 12,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 6, backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: TextStyleNoor(
                    text: "رجوع",
                    size: 12,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
