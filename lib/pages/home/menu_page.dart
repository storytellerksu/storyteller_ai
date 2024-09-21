// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storytellerai/services/user_services.dart';
import 'package:storytellerai/services/database.dart';
import 'package:storytellerai/services/myUser.dart';

class Menu_Page extends StatefulWidget {
  Menu_Page({super.key});

  @override
  State<Menu_Page> createState() => _Menu_PageState();
}

class _Menu_PageState extends State<Menu_Page> {
  final UserServices auth = UserServices();
  String username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    try {
      String fetchedUsername = await auth.getUsername();
      setState(() {
        username = fetchedUsername;
      });
    } catch (error) {
      print('Error fetching username: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 174, 233, 227),
        body: Text("Welcome $username", style: TextStyle(fontSize: 90)),
      ),
    );
  }
}
