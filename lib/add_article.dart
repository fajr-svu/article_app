// add_article_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/article_list_screen.dart';
import 'package:medium/model.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';

class AddArticleScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
              maxLines: 5,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Add the new article to the list
                final newArticle = Article(
                  id: appState.articles.length +
                      1, // replace with appropriate id logic
                  title: _titleController.text,
                  body: _bodyController.text,
                );
                appState.articles.add(newArticle);

                // Clear the text fields
                _titleController.clear();
                _bodyController.clear();

                // Navigate back to the article list
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ArticleListScreen();
                }));
              },
              child: Text('Add Article'),
            ),
          ],
        ),
      ),
    );
  }
}
