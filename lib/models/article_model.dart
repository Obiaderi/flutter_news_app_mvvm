// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelNewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  ModelNewsArticle({
    required this.title,
    required this.publishedAt,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'publishedAt': publishedAt,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  factory ModelNewsArticle.fromMap(Map<String, dynamic> map) {
    return ModelNewsArticle(
      title: map['title'] as String,
      publishedAt: map['publishedAt'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
    );
  }
}
