// ignore_for_file: prefer_const_constructors

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Story_Page extends StatefulWidget {
  const Story_Page({super.key});

  @override
  State<Story_Page> createState() => _Story_PageState();
}

class _Story_PageState extends State<Story_Page> {
  String storyInput = "";
  String storyText = "";

  final globalKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isLoading = false; 

  // 10 images with its corresponding paragraphs
  List<Map<String, String>> data = [];

  // images 
  final List<String> images = [
    'assets/community.webp',
    'assets/feedback.webp',
    'assets/genres.jpg',
    'assets/sharing.webp',
    'assets/librarybooks.jpeg',
    'assets/genres.jpg',
    'assets/genres.jpg',
    'assets/genres.jpg',
    'assets/genres.jpg',
    'assets/genres.jpg',
  ];

  //split story into 10 parts 
  List<String> splitStory(String text) {
    List<String> words = text.split(' ');
    int splitLength = (words.length / 10).ceil();
    List<String> splitText = [];
    for (int i = 0; i < 10; i++) {
      int start = i * splitLength;
      int end = start + splitLength;
      String part = words.sublist(start, end > words.length ? words.length : end).join(' ');
      if (part.isNotEmpty) {
        part = part[0].toUpperCase() + part.substring(1); 
      }
      splitText.add(part);
    }
    return splitText;
  }

  // story generations image to text pair
  getStory(String storyInput) async {
    setState(() {
      isLoading = true; // loading started
    });
    final result =
        await FirebaseFunctions.instance.httpsCallable("generateText").call(
      {
        "text": storyInput,
        "push": true,
      },
    );

    if (result.data["text"] is String) {
      setState(() {
        storyText = result.data["text"] as String;

        // text pair with images
        List<String> storyParts = splitStory(storyText);
        data = List.generate(10, (index) {
          return {
            'image': images[index],
            'text': storyParts[index],
          };
        });
        isLoading = false; // loading is stopped
      });
    } else {
      setState(() {
        isLoading = false; //loading for errors
      });
      throw Exception("Expected a String but got ${result.data.runtimeType}");
    }
  }

  // Event handler for key press
  void handleKeyPress(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter) && globalKey.currentState!.validate()) {
      getStory(storyInput);
    }
  }

//Back page private method
  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

//Next page private method
  void _goToNextPage() {
    if (_currentPage < data.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4F8), 
      appBar: AppBar(
        title: Text('Create', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: handleKeyPress, //check if key is pressed
        child: Form(
          key: globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),

                // textfield for story generation
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Write a Story...",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black54),
                    prefixIcon: Icon(Icons.auto_awesome, color: Colors.blueAccent),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.blueAccent), // arrow icon button
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          getStory(storyInput); // story generation
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
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
                  onFieldSubmitted: (value) {
                    // generate the story
                    if (globalKey.currentState!.validate()) {
                      getStory(storyInput);
                    }
                  },
                  textInputAction: TextInputAction.done, // 
                  enabled: !isLoading, 
                ),

                SizedBox(height: 20),

                // loading indicator 
                if (isLoading)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Generating story...",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                else
                  Expanded(
                    child: data.isNotEmpty
                        ? Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  controller: _pageController,
                                  onPageChanged: (int page) {
                                    setState(() {
                                      _currentPage = page;
                                    });
                                  },
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(top: Radius.circular(30)),
                                              child: Image.asset(
                                                data[index]['image']!,
                                                fit: BoxFit.cover,
                                                height: 250,
                                                width: double.infinity,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Text(
                                                data[index]['text']!,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // back and next buttons UI design
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // align buttons to center
                                  children: [
                                    ElevatedButton(
                                      onPressed: _currentPage > 0 ? _goToPreviousPage : null,
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        backgroundColor: _currentPage > 0
                                            ? Colors.blueAccent
                                            : Colors.grey,
                                      ),
                                      child: Text(
                                        'Back',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(width: 20), // space between buttons
                                    ElevatedButton(
                                      onPressed: _currentPage < data.length - 1
                                          ? _goToNextPage
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        backgroundColor: _currentPage < data.length - 1
                                            ? Colors.blueAccent
                                            : Colors.grey,
                                      ),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Text(
                              "Please generate a story.",
                              style: TextStyle(fontSize: 18, color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
