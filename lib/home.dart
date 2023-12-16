// home_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/add_article.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';
import 'article_list_screen.dart';
import 'profile_screen.dart';
import 'following_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Display the list of articles
          Expanded(
            child: ArticleListScreen(),
          ),
          // Add a button to navigate to the Add Article screen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddArticleScreen();
                }));
              },
              child: Text('Add Article'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Following',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Navigate to the corresponding screen based on the selected tab
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfileScreen();
            }));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FollowingScreen();
            }));
          }
        },
      ),
    );
  }
}
