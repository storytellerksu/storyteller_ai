// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Story_Page extends StatelessWidget {
  const Story_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 159, 186, 188),
        body: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              "assets/storypage_mock.png",
            ),
            Text("fake page btw"),
          ],
        ),
      ),
    );
  }
}
