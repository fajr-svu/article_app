// main.dart

import 'package:flutter/material.dart';
import 'package:medium/add_article.dart';
import 'package:medium/home.dart';
import 'package:medium/provider.dart';
import 'package:medium/regstration_screen.dart';
import 'package:provider/provider.dart';
import 'article_list_screen.dart';
import 'profile_screen.dart';
import 'following_screen.dart';
import 'login_screen.dart';
import 'article_screen.dart'; // Import the ArticleScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        title: 'Article App',
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => ArticleListScreen(),
        //   '/profile': (context) => ProfileScreen(),
        //   '/following': (context) => FollowingScreen(),
        //   '/add_article': (context) => AddArticleScreen(),
        //   '/login': (context) => LoginScreen(),
        //   '/registration': (context) => RegistrationScreen(),
        //   // Add the route for ArticleScreen
        // },
      ),
    );
  }
}
