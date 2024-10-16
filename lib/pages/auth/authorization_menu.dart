// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/login_page.dart';
import 'package:storytellerai/pages/auth/registration.dart';

class AuthorizationMenu extends StatefulWidget {
  const AuthorizationMenu({super.key});

  @override
  _AuthorizationMenuState createState() => _AuthorizationMenuState();
}

class _AuthorizationMenuState extends State<AuthorizationMenu> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  _buildCarouselItem(
                    image: "assets/app_logo.webp",
                    title: "Storyteller AI",
                    description: "Welcome to Storyteller AI",
                  ),
                  _buildCarouselItem(
                    image: "assets/storylady.jpeg",
                    title: "Create Stories",
                    description:
                        "Easily create your own stories with our user-friendly interface.",
                  ),
                  _buildCarouselItem(
                    image: "assets/genre.png",
                    title: "Explore Genres",
                    description:
                        "Browse a wide range of genres to find inspiration.",
                  ),
                  _buildCarouselItem(
                      image: "assets/pixelppl.jpeg",
                      title: "Join Community",
                      description:
                          "Connect with other storytellers and share your work"),
                  _buildCarouselItem(
                      image: "assets/fantasyread.jpeg",
                      title: "Get Feedback",
                      description: "Recieve constructive feedback from peers."),
                  _buildCarouselItem(
                    image: "assets/share.jpeg",
                    title: "Share Your Stories",
                    description:
                        "Publish your stories and reach a wider audience.",
                  ),
                ],
              ),
            ),
            _buildPageIndicators(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: TextStyle(
                            fontSize: 20, fontFamily: 'San Francisco'),
                      ),
                      child: Text("LOGIN"),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: TextStyle(
                            fontSize: 20, fontFamily: 'San Francisco'),
                      ),
                      child: Text("SIGN UP"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      {required String image,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'San Francisco',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontFamily: 'San Francisco',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: _currentPage == index ? 16 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.blueAccent : Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}
