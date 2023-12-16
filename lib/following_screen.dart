// following_screen.dart

import 'package:flutter/material.dart';
import 'package:medium/model.dart';
import 'package:medium/provider.dart';
import 'package:provider/provider.dart';
// Import the User model

class FollowingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
      ),
      body: FutureBuilder(
        future: appState.fetchCurrentUser(1), // Replace with the actual user ID
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Assuming followingUsers is a list of User objects
            List<User> followingUsers =
                appState.currentUser?.followingUsers ?? [];

            if (followingUsers.isEmpty) {
              return Center(
                child: Text('You are not following anyone.'),
              );
            } else {
              return ListView.builder(
                itemCount: followingUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(followingUsers[index].name),
                    subtitle: Text('@${followingUsers[index].username}'),
                    // Add more user details or actions as needed
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
