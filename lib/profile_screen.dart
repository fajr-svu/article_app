// profile_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/article_widget.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder(
        future: appState.fetchCurrentUser(1), // Pass the actual user ID
        builder: (context, snapshot) {
          //if (snapshot.connectionState == ConnectionState.waiting) {
          // return CircularProgressIndicator();
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/photo_6019316294077235608_x.jpg', // Use the actual user image URL
                    ),
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  Text(appState.loggedInUser?.name ?? ''),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
