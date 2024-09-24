// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/home/menu_page.dart';
import 'package:storytellerai/pages/home/settings_page.dart';
import 'package:storytellerai/pages/home/story_page.dart';
import 'package:storytellerai/services/user_services.dart';

class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final UserServices auth = UserServices();

  int currentPage = 0;

  void changePage(index) {
    setState(() {
      currentPage = index;
    });
  }

  final List pageList = [
    Menu_Page(),
    Story_Page(),
    Settings_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.blue[600],
        backgroundColor: Colors.blue[50],
        onTap: changePage,
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sailing),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: [
          Menu_Page(),
          Story_Page(),
          Settings_Page(),
        ],
      ),
    );
  }
}
