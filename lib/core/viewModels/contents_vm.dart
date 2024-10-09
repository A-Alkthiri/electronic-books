import 'package:dio/dio.dart';
import 'package:electronic_books/core/models/category.dart';
import 'package:electronic_books/core/models/content.dart';
import 'package:flutter/widgets.dart';

import '../../helpers/http_helper.dart';
import '../constants/http_urls.dart';
import '../models/base.dart';

class ContentsVm with ChangeNotifier {
  List<Content> contents = [];

  ContentsVm() {
    //getContents(categoryId, typeId);
  }

  getContents(int categoryId, int typeId) async {
    HttpHelper http = HttpHelper.instance;
    Response response = await http.postRequest(
        url: HttpUrls.CATEGORIES_URL,
        data: {"category_id": categoryId, "content_type_id": typeId});
    Base b = Base.fromJson(response.data);
    contents.clear();
    contents =
        b.data.map<Content>((content) => Content.fromJson(content)).toList();

    notifyListeners();
  }
}
