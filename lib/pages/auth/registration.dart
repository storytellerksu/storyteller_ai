// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/services/auth.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final AuthorizationService auth = AuthorizationService();
  final globalKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(100, 181, 246, 1),
        elevation: 0,
        title: Text("Create Account"),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter An Email";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length < 6) {
                    return "Enter a Password Longer than 6 Characters";
                  } else {
                    return null;
                  }
                },
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
                    if (globalKey.currentState!.validate()) {
                      print(email);
                      print(password);
                    }
                  },
                  child: Text("Create Account")),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
