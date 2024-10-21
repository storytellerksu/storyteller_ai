// about.dart
import 'package:flutter/material.dart';

//Nothing on this page, more will be added later on

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Text("The Storyteller AI App is designed to provide users with an immersive storytelling experience by generating personalized stories with accompanying visuals and audio. The application leverages the OpenAI API to create story responses and images based on user input. Once the story and visuals are generated, the app combines them into an MP4 video using a text-to-speech API to narrate the story. Users can save, delete, or share the final video directly from the app."),
      ),
    );
  }
}
