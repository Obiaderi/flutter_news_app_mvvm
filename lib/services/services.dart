import 'package:dio/dio.dart';
import 'package:newsapp_mvvm/constants/contant.dart';
import 'package:newsapp_mvvm/models/article_model.dart';

class WebService {
  var dio = Dio();

  // For top Headlines

  Future<List<ModelNewsArticle>> getTopHeadlines() async {
    final res = await dio.get(Constant.topHeadlines);
    if (res.statusCode == 200) {
      final result = res.data;

      Iterable listOfNews = result["articles"];

      return listOfNews
          .map((article) => ModelNewsArticle.fromMap(article))
          .toList();
    } else {
      throw Exception("response failed");
    }
  }

  Future<List<ModelNewsArticle>> getNewsByCountry(String country) async {
    final res = await dio.get(Constant.newByCountry(country));
    if (res.statusCode == 200) {
      final result = res.data;

      Iterable listOfNews = result["articles"];

      return listOfNews
          .map((article) => ModelNewsArticle.fromMap(article))
          .toList();
    } else {
      throw Exception("response failed");
    }
  }
}
