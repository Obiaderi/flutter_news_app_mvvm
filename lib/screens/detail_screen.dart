// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:newsapp_mvvm/viewmodels/view_model.dart';
import 'package:newsapp_mvvm/widgets/circle_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ViewModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: CircleImage(imageUrl: article.urlToImage),
            ),
            Text(article.publishedAt),
            const SizedBox(height: 20),
            Center(
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              article.description,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
