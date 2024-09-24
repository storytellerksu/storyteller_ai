// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class Story_Page extends StatefulWidget {
  const Story_Page({super.key});

  @override
  State<Story_Page> createState() => _Story_PageState();
}

class _Story_PageState extends State<Story_Page> {
  String storyText = "";

  getStory() async {
    print("step 1");
    final result =
        await FirebaseFunctions.instance.httpsCallable("generateText").call(
      {
        "text": "text",
        "push": true,
      },
    );
    print("step 2");
    if (result.data is String) {
      print("step 3");
      setState(() {
        storyText = result.data as String;
      });
      print("step 4");
    } else {
      throw Exception("Expected a String but got ${result.data.runtimeType}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 159, 186, 188),
        body: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await getStory();
                },
                child: Text("Press to Generate Story!"),
              ),
            ),
            Text(storyText),
          ],
        ),
      ),
    );
  }
}
