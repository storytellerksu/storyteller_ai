// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/services/auth.dart';

class Home_Page extends StatelessWidget {
  Home_Page({super.key});

  final AuthorizationService auth = AuthorizationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue[300],
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await auth.logOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
