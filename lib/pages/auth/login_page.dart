import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/registration.dart';
import 'package:storytellerai/services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthorizationService auth = AuthorizationService();

  String email = "";
  String password = "";

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
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  print(email);
                  print(password);
                },
                child: Text("Sign In")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
            ),
            SizedBox(height: 20),
            Text("Don't Have an Account?"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Registration(),
                    ),
                  );
                },
                child: Text("Sign-Up")),
          ],
        ),
      ),
    );
  }
}
