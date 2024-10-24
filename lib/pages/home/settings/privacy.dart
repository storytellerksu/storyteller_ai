// privacy.dart
import 'package:flutter/material.dart';

//Nothing on this page, more will be added later on

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 239, 240),
        title: Text("Privacy"),
      ),
      body: Center(
        child: Image.asset(
          "assets/meme3.jpeg",
        ),
      ),
    );
  }
}
