// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/screens/detail_screen.dart';

import 'package:newsapp_mvvm/viewmodels/view_model.dart';
import 'package:newsapp_mvvm/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  const NewsGrid({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<ViewModel> articles;

  void _showNewDetailScreen(BuildContext context, ViewModel vm) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreen(article: vm),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: articles.length,
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () => _showNewDetailScreen(context, article),
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: CircleImage(imageUrl: article.urlToImage),
          ),
        );
      },
    );
  }
}
