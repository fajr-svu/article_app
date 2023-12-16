// article_list_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';

import 'article_widget.dart'; // Import the ArticleWidget

class ArticleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: FutureBuilder(
        future: appState.fetchArticles(),
        builder: (context, snapshot) {
          //if (snapshot.connectionState == ConnectionState.waiting) {
          //return Center(child: CircularProgressIndicator());
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: appState.articles.length,
              itemBuilder: (context, index) {
                return ArticleWidget(article: appState.articles[index]);
              },
            );
          }
        },
      ),
    );
  }
}
