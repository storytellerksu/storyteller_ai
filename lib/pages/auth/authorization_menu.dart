// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/login_page.dart';
import 'package:storytellerai/pages/auth/registration.dart';

class AuthorizationMenu extends StatelessWidget {
  const AuthorizationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Placeholder(),
            Text(
              "StoryTeller AI",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            Text("Description of the App"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Text("LOGIN"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Registration(),
                  ),
                );
              },
              child: Text("SIGN UP"),
            ),
          ],
        ),
      ),
    );
  }
}
