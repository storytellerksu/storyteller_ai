// app_support_page.dart
import 'package:flutter/material.dart';

//Nothing on this page, more will be added later on

class AppSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("App Support"),
        backgroundColor: const Color.fromARGB(255, 168, 239, 240),
      ),
      body: Column(
        children: [
          Text("Stuffs for now"),
          Text("Owen is our 24/7 support agent (for girls only)"),
          Image.asset(
            "assets/meme2.jpeg",
            height: 200,
            fit: BoxFit.cover,
          ),
          Image.asset("assets/meme1.jpeg", height: 200),
        ],
      ),
    );
  }
}
