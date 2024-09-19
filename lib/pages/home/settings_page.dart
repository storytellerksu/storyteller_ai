// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/services/auth.dart';

class Settings_Page extends StatelessWidget {
  Settings_Page({super.key});

  final AuthorizationService auth = AuthorizationService();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 174, 233, 227),
        body: Column(
          children: [
            SizedBox(height: 80),
            Text("SETTnIGS lougout button below :0",
                style: TextStyle(fontSize: 80)),
            IconButton(
              onPressed: () async {
                await auth.logOut();
              },
              icon: Icon(Icons.logout_outlined),
              color: const Color.fromARGB(255, 21, 0, 255),
              iconSize: 70,
            )
          ],
        ),
      ),
    );
  }
}
