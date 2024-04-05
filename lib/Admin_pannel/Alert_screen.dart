import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Global variables to store user inputs
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Popup Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the popup and get user inputs
            _showPopup(context);
          },
          child: Text('Open Popup'),
        ),
      ),
    );
  }

  Future<void> _showPopup(BuildContext context) async {
    // Controllers for text fields
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    // Show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Store user inputs in global variables
                username = usernameController.text;
                email = emailController.text;

                // Close the popup
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );

    // Dispose controllers after using
    usernameController.dispose();
    emailController.dispose();

    // You can now use the username and email variables in other screens or widgets
    print('Username: $username');
    print('Email: $email');
  }
}