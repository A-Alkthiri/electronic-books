import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/http_helper.dart';
import '../constants/http_urls.dart';
import '../models/base.dart';
import '../models/category.dart';

class CategoriesVm with ChangeNotifier {
  List<Category> categories = [];

  CategoriesVm() {
    loadCategories();
  }

  loadCategories() async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response response = await http.getRequest(url: HttpUrls.CATEGORIES_URL);
      Base b = Base.fromJson(response.data);
      categories = b.data
          .map<Category>((content) => Category.fromJson(content))
          .toList();
      notifyListeners();
    } catch (e) {
      print("err $e");
    }
  }
}
