// article_model.dart

class Article {
  final int id;
  final String title;
  final String body;

  Article({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final List<User> followingUsers; // New property

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.followingUsers,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<User> followingList = [];

    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      followingUsers: followingList,
    );
  }
}
