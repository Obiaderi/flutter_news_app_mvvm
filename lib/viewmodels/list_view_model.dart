import 'package:flutter/cupertino.dart';
import 'package:newsapp_mvvm/models/article_model.dart';
import 'package:newsapp_mvvm/services/services.dart';
import 'package:newsapp_mvvm/viewmodels/view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ListViewModel with ChangeNotifier {
  //first initialize viewModel = empty
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<ViewModel> article = [];

  // Methods to fetch news
  void getTopNewsHeadlines() async {
    List<ModelNewsArticle> newsArticle = await WebService().getTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    article =
        newsArticle.map((article) => ViewModel(article: article)).toList();

    if (article.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  // Methods to fetch news by country
  void fetchNewsByCountry(String country) async {
    List<ModelNewsArticle> newsArticle =
        await WebService().getNewsByCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    article =
        newsArticle.map((article) => ViewModel(article: article)).toList();

    if (article.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
