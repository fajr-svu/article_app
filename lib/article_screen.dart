// article_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/model.dart';
import 'package:medium/profile_screen.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  ArticleScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileScreen(),
            Text(
              article.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              article.body,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
