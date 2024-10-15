// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/services/user_services.dart';

class Menu_Page extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
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
        appBar: AppBar(
          title: Text("Home"),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Story 1", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text("Stuffs here")
                    
                    
                  ],
                ),

              ),
            )

            
          ],
        )
        
      ),
    );
  }
}
