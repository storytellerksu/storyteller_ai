// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/login_page.dart';
import 'package:storytellerai/pages/wrapper.dart';
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
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: EdgeInsets.all(50),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
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
                      dynamic result =
                          await auth.emailRegistration(email, password);
                      if (result == null) {
                        setState(() {
                          error = "ERROR";
                        });
                      } else if (result == 1) {
                        setState(() {
                          error = "Email Already in Use";
                        });
                      } else if (result == 2) {
                        setState(() {
                          error = "Invalid Email Format";
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Wrapper(),
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Create Account")),
              SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              Text("Already Have an Account?"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text("Log In")),
            ],
          ),
        ),
      ),
    );
  }
}
