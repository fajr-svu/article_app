// registration_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/home.dart';
import 'package:medium/login_screen.dart';
import 'package:medium/model.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic
                // For simplicity, checking if all fields are not empty
                if (usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  // Assume successful registration for demonstration purposes
                  appState.setLoggedInUser(User(
                    id: 1,
                    name: usernameController.text,
                    username: usernameController.text,
                    followingUsers: [], // Initialize with an empty list
                  ));

                  // Navigate to the home screen or any other screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                } else {
                  // Show an error message or handle the case where registration fails
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Registration Failed'),
                      content: Text('Please fill in all fields.'),
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
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
