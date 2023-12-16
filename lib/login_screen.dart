// login_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/article_list_screen.dart';
import 'package:medium/article_widget.dart';
import 'package:medium/home.dart';
import 'package:medium/model.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform login logic
                // For simplicity, checking if the username and password are not empty
                if (_usernameController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  // Assume successful login for demonstration purposes
                  appState.setLoggedInUser(User(
                    id: 1,
                    name: 'John Doe',
                    username: _usernameController.text,
                    followingUsers: [], // Initialize with an empty list
                  ));

                  // Navigate to the home screen or any other screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                } else {
                  // Show an error message or handle the case where login fails
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Login Failed'),
                      content:
                          Text('Please enter valid username and password.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
