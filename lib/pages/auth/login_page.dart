import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storytellerai/services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthorizationService auth = AuthorizationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: Text("Log In"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(
            onPressed: () async {
              dynamic result = await auth.guestSignIn();
              if (result == null) {
                print("Error Logging In");
              } else {
                print("Logging In");
                print(result.uid);
              }
            },
            child: Text("Sign-in as Guest"),
          )),
    );
  }
}
