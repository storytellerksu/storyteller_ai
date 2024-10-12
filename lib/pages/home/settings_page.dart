// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/services/user_services.dart';
import 'package:storytellerai/settings/App_support.dart';
import 'package:storytellerai/settings/about.dart';
import 'package:storytellerai/settings/legal.dart';
import 'package:storytellerai/settings/privacy.dart';

//Setting page has a listView that contains each section of the settings. Each section is clickable


class Settings_Page extends StatelessWidget {
  Settings_Page({super.key});

  final UserServices auth = UserServices();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, 
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            ListTile(
              title: Text("App Support"),
              onTap: () {
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AppSupportPage()),
                 );
              },
            ),
            ListTile(
              title: Text("About"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              title: Text("Legal"),
              onTap: () {
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LegalPage()),
                );
              },
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PrivacyPage()),
                );
              },
            ),
            Divider(), // divider
            ListTile(
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () async {
                await auth.logOut();
                // login page after logout
                Navigator.of(context).pushReplacementNamed('/login'); // Update this with your login route
              },
              trailing: Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
