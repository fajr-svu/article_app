// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medium/model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => Article.fromJson(model)).toList();
    } else {
      throw Exception("Failed to load articles");
    }
  }

  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);
      return User.fromJson(userData);
    } else {
      throw Exception("Failed to load user");
    }
  }
}
