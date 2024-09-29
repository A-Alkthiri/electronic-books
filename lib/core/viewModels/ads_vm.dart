import 'package:dio/dio.dart';
import 'package:electronic_books/core/constants/http_urls.dart';
import 'package:electronic_books/core/models/ads.dart';
import 'package:electronic_books/core/models/base.dart';
import 'package:electronic_books/helpers/http_helper.dart';
import 'package:flutter/cupertino.dart';

class AdsVm with ChangeNotifier {
  List<Ads> allAds = [];
  AdsVm() {
    getAds();
  }
  getAds() async {
    HttpHelper http = HttpHelper.instance;
    Response response = await http.getRequest(url: HttpUrls.ADS_URL);
    Base b = Base.fromJson(response.data);
    allAds = b.data.map<Ads>((ads) => Ads.fromJson(ads)).toList();
    notifyListeners();
  }
}
