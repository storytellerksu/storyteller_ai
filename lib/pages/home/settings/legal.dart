// LegalPage.dart
import 'package:flutter/material.dart';

//Nothing on this page, more will be added later on

class LegalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Legal"),
        backgroundColor: const Color.fromARGB(255, 168, 239, 240),
      ),
      body: Center(
        child: Image.asset("assets/placehold.jpeg"),
      ),
    );
  }
}
