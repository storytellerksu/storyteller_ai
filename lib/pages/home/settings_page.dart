// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/services/auth.dart';

class Settings_Page extends StatelessWidget {
  Settings_Page({super.key});

  final AuthorizationService auth = AuthorizationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("SETTTINNGS", style: TextStyle(fontSize: 100)),
          IconButton(
            onPressed: () async {
              await auth.logOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
