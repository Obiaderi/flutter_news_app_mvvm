import 'package:intl/intl.dart';
import 'package:newsapp_mvvm/models/article_model.dart';

class ViewModel {
  final ModelNewsArticle _modelNewsArticle;

  ViewModel({required ModelNewsArticle article}) : _modelNewsArticle = article;

  // Setting a getter for all our model fiels
  String get title => _modelNewsArticle.title;
  String get description => _modelNewsArticle.description;
  String get url => _modelNewsArticle.url;
  String get urlToImage => _modelNewsArticle.urlToImage;

  String get publishedAt {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ')
        .parse(_modelNewsArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime);
  }
}
