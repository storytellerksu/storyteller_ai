// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class Story_Page extends StatefulWidget {
  const Story_Page({super.key});

  @override
  State<Story_Page> createState() => _Story_PageState();
}

class _Story_PageState extends State<Story_Page> {
  String storyInput = "";
  String storyText = "";
  final globalKey = GlobalKey<FormState>();

  getStory(String storyInput) async {
    print("step 1");
    final result =
        await FirebaseFunctions.instance.httpsCallable("generateText").call(
      {
        "text": storyInput,
        "push": true,
      },
    );
    print("step 2");
    if (result.data["text"] is String) {
      print("step 3");
      setState(() {
        storyText = result.data["text"] as String;
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
        body: Form(
          key: globalKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Write a Story...",
                    prefixIcon: Icon(Icons.auto_awesome),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Text Field";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    storyInput = value;
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (globalKey.currentState!.validate()) {
                      await getStory(storyInput);
                    }
                  },
                  child: Text("Press to Generate Story!"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(storyText);
                  },
                  child: Text("troubleshoot")),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 0, bottom: 150),
                  children: [Text(storyText)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
