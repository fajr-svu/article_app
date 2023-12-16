// app_state.dart

import 'package:flutter/material.dart';
import 'package:medium/model.dart';
import 'api_service.dart';

class AppState extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Article> articles = [];
  User? currentUser;
  User? loggedInUser;

  Future<void> fetchArticles() async {
    articles = await _apiService.getArticles();
    notifyListeners();
  }

  Future<void> fetchCurrentUser(int userId) async {
    currentUser = await _apiService.getUser(userId);
    notifyListeners();
  }

  void setLoggedInUser(User user) {
    loggedInUser = user;
    notifyListeners();
  }

  // Method to check if a user is logged in
  bool isLoggedIn() {
    return loggedInUser != null;
  }

  // Method to log out
  void logOut() {
    loggedInUser = null;
    notifyListeners();
  }
}
