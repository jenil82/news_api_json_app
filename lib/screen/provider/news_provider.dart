import 'package:flutter/material.dart';

import '../../utills/news_helper.dart';
import '../modal/news_modal.dart';
class homeProvider extends ChangeNotifier
{

  String selectedCountry = "in";

  void change(String country)
  {
    selectedCountry = country;
    notifyListeners();
  }

  Future<Welcome> getNews(country)
  async {

    homeHelper h1 = homeHelper();

    var NewsApi = await h1.newsApi(country);
    return NewsApi;

  }
}
