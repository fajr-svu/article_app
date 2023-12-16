// article_widget.dart

import 'package:flutter/material.dart';
import 'package:medium/model.dart';
import 'article_screen.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  ArticleWidget({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(40.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.asset('assets/images/photo_6019316294077235608_x.jpg'),
        title: Center(child: Text(article.title)),
        subtitle: Text(article.body),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleScreen(article: article),
            ),
          );
        },
      ),
    );
  }
}
