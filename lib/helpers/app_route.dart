import 'package:electronic_books/core/models/content.dart';
import 'package:electronic_books/core/views/screens/about_screen.dart';
import 'package:electronic_books/core/views/screens/app_video_player.dart';
import 'package:electronic_books/core/views/screens/books_screen.dart';
import 'package:electronic_books/core/views/screens/fatawa_screen.dart';
import 'package:electronic_books/core/views/screens/home_screen.dart';
import 'package:electronic_books/core/views/screens/maqalat_screen.dart';
import 'package:electronic_books/core/views/screens/pdf_screen.dart';
import 'package:electronic_books/core/views/screens/test.dart';
import 'package:electronic_books/core/views/screens/videos_screen.dart';
import 'package:electronic_books/core/views/screens/volumes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: HomeScreen()));
      case '/maqalat':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: MaqalatScreen()));
      case '/videos':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: VideosScreen()));
      case '/books':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: BooksScreen()));
      case '/test':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: Test()));
      case '/about':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: AboutScreen()));
      case '/volumes':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: VolumesScreen()));
      case '/fatawa':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl, child: FatawaScreen()));
      case '/pdf':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl,
                child: PdfScreen(
                    // content: settings.arguments as Content,
                    )));
      case '/youtube':
        return MaterialPageRoute(
            builder: (ctx) => Directionality(
                textDirection: TextDirection.rtl,
                child: YouTubeVideoPage(
                  content: settings.arguments as Content,
                  // content: settings.arguments as Content,
                )));
    }
  }
}
